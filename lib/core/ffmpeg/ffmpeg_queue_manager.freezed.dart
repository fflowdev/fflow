// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ffmpeg_queue_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FfmpegQueueState {

 int get maxConcurrentTasks; List<FfmpegTask> get tasks;
/// Create a copy of FfmpegQueueState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FfmpegQueueStateCopyWith<FfmpegQueueState> get copyWith => _$FfmpegQueueStateCopyWithImpl<FfmpegQueueState>(this as FfmpegQueueState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FfmpegQueueState&&(identical(other.maxConcurrentTasks, maxConcurrentTasks) || other.maxConcurrentTasks == maxConcurrentTasks)&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,maxConcurrentTasks,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'FfmpegQueueState(maxConcurrentTasks: $maxConcurrentTasks, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $FfmpegQueueStateCopyWith<$Res>  {
  factory $FfmpegQueueStateCopyWith(FfmpegQueueState value, $Res Function(FfmpegQueueState) _then) = _$FfmpegQueueStateCopyWithImpl;
@useResult
$Res call({
 int maxConcurrentTasks, List<FfmpegTask> tasks
});




}
/// @nodoc
class _$FfmpegQueueStateCopyWithImpl<$Res>
    implements $FfmpegQueueStateCopyWith<$Res> {
  _$FfmpegQueueStateCopyWithImpl(this._self, this._then);

  final FfmpegQueueState _self;
  final $Res Function(FfmpegQueueState) _then;

/// Create a copy of FfmpegQueueState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxConcurrentTasks = null,Object? tasks = null,}) {
  return _then(_self.copyWith(
maxConcurrentTasks: null == maxConcurrentTasks ? _self.maxConcurrentTasks : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
as int,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<FfmpegTask>,
  ));
}

}


/// Adds pattern-matching-related methods to [FfmpegQueueState].
extension FfmpegQueueStatePatterns on FfmpegQueueState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FfmpegQueueState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FfmpegQueueState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FfmpegQueueState value)  $default,){
final _that = this;
switch (_that) {
case _FfmpegQueueState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FfmpegQueueState value)?  $default,){
final _that = this;
switch (_that) {
case _FfmpegQueueState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxConcurrentTasks,  List<FfmpegTask> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FfmpegQueueState() when $default != null:
return $default(_that.maxConcurrentTasks,_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxConcurrentTasks,  List<FfmpegTask> tasks)  $default,) {final _that = this;
switch (_that) {
case _FfmpegQueueState():
return $default(_that.maxConcurrentTasks,_that.tasks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxConcurrentTasks,  List<FfmpegTask> tasks)?  $default,) {final _that = this;
switch (_that) {
case _FfmpegQueueState() when $default != null:
return $default(_that.maxConcurrentTasks,_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class _FfmpegQueueState extends FfmpegQueueState {
  const _FfmpegQueueState({required this.maxConcurrentTasks, final  List<FfmpegTask> tasks = const <FfmpegTask>[]}): _tasks = tasks,super._();
  

@override final  int maxConcurrentTasks;
 final  List<FfmpegTask> _tasks;
@override@JsonKey() List<FfmpegTask> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of FfmpegQueueState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FfmpegQueueStateCopyWith<_FfmpegQueueState> get copyWith => __$FfmpegQueueStateCopyWithImpl<_FfmpegQueueState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FfmpegQueueState&&(identical(other.maxConcurrentTasks, maxConcurrentTasks) || other.maxConcurrentTasks == maxConcurrentTasks)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,maxConcurrentTasks,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'FfmpegQueueState(maxConcurrentTasks: $maxConcurrentTasks, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$FfmpegQueueStateCopyWith<$Res> implements $FfmpegQueueStateCopyWith<$Res> {
  factory _$FfmpegQueueStateCopyWith(_FfmpegQueueState value, $Res Function(_FfmpegQueueState) _then) = __$FfmpegQueueStateCopyWithImpl;
@override @useResult
$Res call({
 int maxConcurrentTasks, List<FfmpegTask> tasks
});




}
/// @nodoc
class __$FfmpegQueueStateCopyWithImpl<$Res>
    implements _$FfmpegQueueStateCopyWith<$Res> {
  __$FfmpegQueueStateCopyWithImpl(this._self, this._then);

  final _FfmpegQueueState _self;
  final $Res Function(_FfmpegQueueState) _then;

/// Create a copy of FfmpegQueueState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxConcurrentTasks = null,Object? tasks = null,}) {
  return _then(_FfmpegQueueState(
maxConcurrentTasks: null == maxConcurrentTasks ? _self.maxConcurrentTasks : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
as int,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<FfmpegTask>,
  ));
}


}

// dart format on
