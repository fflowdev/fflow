// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueueSettings {

 int get maxConcurrentTasks;
/// Create a copy of QueueSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueSettingsCopyWith<QueueSettings> get copyWith => _$QueueSettingsCopyWithImpl<QueueSettings>(this as QueueSettings, _$identity);

  /// Serializes this QueueSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueSettings&&(identical(other.maxConcurrentTasks, maxConcurrentTasks) || other.maxConcurrentTasks == maxConcurrentTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxConcurrentTasks);

@override
String toString() {
  return 'QueueSettings(maxConcurrentTasks: $maxConcurrentTasks)';
}


}

/// @nodoc
abstract mixin class $QueueSettingsCopyWith<$Res>  {
  factory $QueueSettingsCopyWith(QueueSettings value, $Res Function(QueueSettings) _then) = _$QueueSettingsCopyWithImpl;
@useResult
$Res call({
 int maxConcurrentTasks
});




}
/// @nodoc
class _$QueueSettingsCopyWithImpl<$Res>
    implements $QueueSettingsCopyWith<$Res> {
  _$QueueSettingsCopyWithImpl(this._self, this._then);

  final QueueSettings _self;
  final $Res Function(QueueSettings) _then;

/// Create a copy of QueueSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxConcurrentTasks = null,}) {
  return _then(_self.copyWith(
maxConcurrentTasks: null == maxConcurrentTasks ? _self.maxConcurrentTasks : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueSettings].
extension QueueSettingsPatterns on QueueSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueSettings value)  $default,){
final _that = this;
switch (_that) {
case _QueueSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueSettings value)?  $default,){
final _that = this;
switch (_that) {
case _QueueSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxConcurrentTasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueSettings() when $default != null:
return $default(_that.maxConcurrentTasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxConcurrentTasks)  $default,) {final _that = this;
switch (_that) {
case _QueueSettings():
return $default(_that.maxConcurrentTasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxConcurrentTasks)?  $default,) {final _that = this;
switch (_that) {
case _QueueSettings() when $default != null:
return $default(_that.maxConcurrentTasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueSettings implements QueueSettings {
  const _QueueSettings({required this.maxConcurrentTasks});
  factory _QueueSettings.fromJson(Map<String, dynamic> json) => _$QueueSettingsFromJson(json);

@override final  int maxConcurrentTasks;

/// Create a copy of QueueSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueSettingsCopyWith<_QueueSettings> get copyWith => __$QueueSettingsCopyWithImpl<_QueueSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueSettings&&(identical(other.maxConcurrentTasks, maxConcurrentTasks) || other.maxConcurrentTasks == maxConcurrentTasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxConcurrentTasks);

@override
String toString() {
  return 'QueueSettings(maxConcurrentTasks: $maxConcurrentTasks)';
}


}

/// @nodoc
abstract mixin class _$QueueSettingsCopyWith<$Res> implements $QueueSettingsCopyWith<$Res> {
  factory _$QueueSettingsCopyWith(_QueueSettings value, $Res Function(_QueueSettings) _then) = __$QueueSettingsCopyWithImpl;
@override @useResult
$Res call({
 int maxConcurrentTasks
});




}
/// @nodoc
class __$QueueSettingsCopyWithImpl<$Res>
    implements _$QueueSettingsCopyWith<$Res> {
  __$QueueSettingsCopyWithImpl(this._self, this._then);

  final _QueueSettings _self;
  final $Res Function(_QueueSettings) _then;

/// Create a copy of QueueSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxConcurrentTasks = null,}) {
  return _then(_QueueSettings(
maxConcurrentTasks: null == maxConcurrentTasks ? _self.maxConcurrentTasks : maxConcurrentTasks // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
