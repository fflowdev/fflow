import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:fflow/core/settings/application/app_settings_repository_provider.dart';
import 'package:fflow/core/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_settings_provider.freezed.dart';
part 'app_settings_provider.g.dart';

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
      T == String || T == int || T == double || T == bool,
      '''Type T must be a primitive type that can be directly stored in the repository.''',
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
  ) async {
    final repository = ref.watch(appSettingsRepositoryProvider);

    final saveDebouncer = Debouncer<ValueT?>(
      const Duration(milliseconds: 500),
      initialValue: null,
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
      if (previous != null && next.value != previous.value) {
        logger.d('${args.key}: Settings changed: ${next.value}');
        saveDebouncer.value = next.value;
      }
    });

    final data = await repository.getValue<DataT>(args.key);
    if (data != null) {
      return args.valueBuilder(data);
    }
    throw StateError('No data found for key ${args.key}');
  }

  void setValue(ValueT value) {
    state = AsyncValue.data(value);
  }
}
