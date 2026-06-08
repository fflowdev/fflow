// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ffmpeg_queue_manager.dart';

// ***************************************************************************
// FreezedGenerator
// ***************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FfmpegQueueState {
  int get maxConcurrentTasks;
  List<FfmpegTask> get tasks;

  /// Create a copy of FfmpegQueueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FfmpegQueueStateCopyWith<FfmpegQueueState> get copyWith =>
      _$FfmpegQueueStateCopyWithImpl<FfmpegQueueState>(
        this as FfmpegQueueState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfmpegQueueState &&
            (identical(other.maxConcurrentTasks, maxConcurrentTasks) ||
                other.maxConcurrentTasks == maxConcurrentTasks) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    maxConcurrentTasks,
    const DeepCollectionEquality().hash(tasks),
  );

  @override
  String toString() {
    return 'FfmpegQueueState(maxConcurrentTasks: $maxConcurrentTasks, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $FfmpegQueueStateCopyWith<$Res> {
  factory $FfmpegQueueStateCopyWith(
    FfmpegQueueState value,
    $Res Function(FfmpegQueueState) _then,
  ) = _$FfmpegQueueStateCopyWithImpl<$Res>;

  @useResult
  $Res call({int? maxConcurrentTasks, List<FfmpegTask>? tasks});
}

/// @nodoc
class _$FfmpegQueueStateCopyWithImpl<$Res>
    implements $FfmpegQueueStateCopyWith<$Res> {
  _$FfmpegQueueStateCopyWithImpl(this._self, this._then);

  final FfmpegQueueState _self;
  final $Res Function(FfmpegQueueState) _then;

  /// Create a copy of FfmpegQueueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? maxConcurrentTasks = freezed, Object? tasks = freezed}) {
    return _then(
      _FfmpegQueueState(
        maxConcurrentTasks:
            maxConcurrentTasks == freezed
                ? _self.maxConcurrentTasks
                : maxConcurrentTasks as int,
        tasks: tasks == freezed ? _self.tasks : tasks as List<FfmpegTask>,
      ),
    );
  }
}

/// @nodoc
class _FfmpegQueueState extends FfmpegQueueState {
  const _FfmpegQueueState({
    required this.maxConcurrentTasks,
    final List<FfmpegTask> tasks = const [],
  }) : _tasks = tasks, super._();

  @override
  final int maxConcurrentTasks;
  final List<FfmpegTask> _tasks;

  @override
  List<FfmpegTask> get tasks {
    if (_tasks is EqualUnmodifiableListView<FfmpegTask>) {
      return _tasks;
    }
    return EqualUnmodifiableListView(_tasks);
  }

  /// Create a copy of FfmpegQueueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FfmpegQueueStateCopyWith<_FfmpegQueueState> get copyWith =>
      __$FfmpegQueueStateCopyWithImpl<_FfmpegQueueState>(this, _$identity);
}

/// @nodoc
abstract mixin class _$FfmpegQueueStateCopyWith<$Res>
    implements $FfmpegQueueStateCopyWith<$Res> {
  factory _$FfmpegQueueStateCopyWith(
    _FfmpegQueueState value,
    $Res Function(_FfmpegQueueState) _then,
  ) = __$FfmpegQueueStateCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int? maxConcurrentTasks, List<FfmpegTask>? tasks});
}

/// @nodoc
class __$FfmpegQueueStateCopyWithImpl<$Res>
    implements _$FfmpegQueueStateCopyWith<$Res> {
  __$FfmpegQueueStateCopyWithImpl(this._self, this._then);

  final _FfmpegQueueState _self;
  final $Res Function(_FfmpegQueueState) _then;

  /// Create a copy of FfmpegQueueState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? maxConcurrentTasks = freezed, Object? tasks = freezed}) {
    return _then(
      _FfmpegQueueState(
        maxConcurrentTasks:
            maxConcurrentTasks == freezed
                ? _self.maxConcurrentTasks
                : maxConcurrentTasks as int,
        tasks: tasks == freezed ? _self._tasks : tasks as List<FfmpegTask>,
      ),
    );
  }
}

// dart format on
