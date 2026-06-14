import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:fflow/core/settings/application/app_settings_repository_provider.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings_provider.freezed.dart';
part 'app_settings_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, Object>> _appPreloadSettings(Ref ref) async {
  logger.d('Preloading app settings...');
  ref.onDispose(() {
    logger.d('Preload app settings disposed');
  });

  final repository = ref.watch(appSettingsRepositoryProvider);
  final allSettings = await repository.getAll();
  logger.d('Preloaded app settings: $allSettings');

  return Map.fromEntries(allSettings.map((kv) => MapEntry(kv.key, kv.value)));
}

@riverpod
class AppPreloadSettingsNotifier extends _$AppPreloadSettingsNotifier {
  @override
  FutureOr<void> build() {
    if (ref.exists(_appPreloadSettingsProvider) &&
        ref.read(_appPreloadSettingsProvider).hasValue) {
      return null;
    }
    return ref.read(_appPreloadSettingsProvider.future);
  }

  T? get<T>(String key) {
    if (!ref.exists(_appPreloadSettingsProvider) ||
        !ref.read(_appPreloadSettingsProvider).hasValue) {
      logger.w(
        '''Attempted to access preload settings for key "$key" before they were loaded. Returning null.''',
      );
      return null;
    }

    final settings = ref.read(_appPreloadSettingsProvider).requireValue;
    final value = settings.remove(key) as T?;
    if (value == null) {
      logger.d('''No preload setting found for key "$key". Returning null.''');
    }

    return value;
  }
}

@freezed
abstract class AppSettingsNotifierArguments<DataT extends Object, ValueT>
    with _$AppSettingsNotifierArguments<DataT, ValueT> {
  const factory AppSettingsNotifierArguments({
    required String key,
    required ValueT Function(DataT data) valueBuilder,
    required DataT Function(ValueT value) dataBuilder,
  }) = _AppSettingsNotifierArguments<DataT, ValueT>;

  /// A helper constructor for simple cases where no conversion is needed
  /// between the stored data and the business object.
  ///
  /// Make sure [T] is a type that can be directly stored in the repository
  /// (e.g., String, int, etc.).
  static AppSettingsNotifierArguments<T, T> withoutConvert<T extends Object>(
    String key, {
    T? defaultValue,
  }) {
    assert(
      T != dynamic,
      'You must specify a concrete type for T when using withoutConvert.',
    );
    assert(
      T == String ||
          T == int ||
          T == BigInt ||
          T == double ||
          T == bool ||
          T == Uint8List ||
          T == DateTime,
      '''
      Type T must be a primitive type that can be directly stored in the repository.
      https://drift.simonbinder.eu/dart_api/tables/#column-types
      ''',
    );
    return AppSettingsNotifierArguments<T, T>(
      key: key,
      valueBuilder: (data) => data,
      dataBuilder: (value) => value,
    );
  }
}

@riverpod
class AppSettingsNotifier<DataT extends Object, ValueT>
    extends _$AppSettingsNotifier<DataT, ValueT> {
  @override
  FutureOr<ValueT> build(
    AppSettingsNotifierArguments<DataT, ValueT> args,
  ) {
    final repository = ref.watch(appSettingsRepositoryProvider);
    final preloadData = ref
        .read(appPreloadSettingsProvider.notifier)
        .get<DataT>(args.key);
    final preloadValue = preloadData != null
        ? args.valueBuilder(preloadData)
        : null;

    final saveDebouncer = Debouncer<ValueT?>(
      const Duration(milliseconds: 500),
      initialValue: preloadValue,
      onChanged: (value) async {
        if (value != null) {
          logger.d('${args.key}: Saving settings: $value');
          final data = args.dataBuilder(value);
          await repository.setValue<DataT>(args.key, data);
        }
      },
    );
    ref.onDispose(saveDebouncer.cancel);
    listenSelf((previous, next) async {
      if (previous != null &&
          previous.hasValue &&
          next.value != previous.value) {
        logger.d('${args.key}: Settings changed: ${next.value}');
        saveDebouncer.value = next.value;
      }
    });

    if (preloadValue != null) {
      return preloadValue;
    }

    return Future(() async {
      final data = await repository.getValue<DataT>(args.key);
      if (data != null) {
        return args.valueBuilder(data);
      }
      throw StateError('No data found for key ${args.key}');
    });
  }

  void setValue(ValueT value) {
    state = AsyncValue.data(value);
  }
}
