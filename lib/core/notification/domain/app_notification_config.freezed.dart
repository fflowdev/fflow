// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppNotificationConfig {

 int get maxCount; Offset Function(int rank) get stepSizeOffset; Offset Function(int rank) get stepPositionOffset; Duration get defaultDuration; Duration get animationDuration; Curve get animationCurve;
/// Create a copy of AppNotificationConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationConfigCopyWith<AppNotificationConfig> get copyWith => _$AppNotificationConfigCopyWithImpl<AppNotificationConfig>(this as AppNotificationConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationConfig&&(identical(other.maxCount, maxCount) || other.maxCount == maxCount)&&(identical(other.stepSizeOffset, stepSizeOffset) || other.stepSizeOffset == stepSizeOffset)&&(identical(other.stepPositionOffset, stepPositionOffset) || other.stepPositionOffset == stepPositionOffset)&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&(identical(other.animationDuration, animationDuration) || other.animationDuration == animationDuration)&&(identical(other.animationCurve, animationCurve) || other.animationCurve == animationCurve));
}


@override
int get hashCode => Object.hash(runtimeType,maxCount,stepSizeOffset,stepPositionOffset,defaultDuration,animationDuration,animationCurve);

@override
String toString() {
  return 'AppNotificationConfig(maxCount: $maxCount, stepSizeOffset: $stepSizeOffset, stepPositionOffset: $stepPositionOffset, defaultDuration: $defaultDuration, animationDuration: $animationDuration, animationCurve: $animationCurve)';
}


}

/// @nodoc
abstract mixin class $AppNotificationConfigCopyWith<$Res>  {
  factory $AppNotificationConfigCopyWith(AppNotificationConfig value, $Res Function(AppNotificationConfig) _then) = _$AppNotificationConfigCopyWithImpl;
@useResult
$Res call({
 int maxCount, Offset Function(int rank) stepSizeOffset, Offset Function(int rank) stepPositionOffset, Duration defaultDuration, Duration animationDuration, Curve animationCurve
});




}
/// @nodoc
class _$AppNotificationConfigCopyWithImpl<$Res>
    implements $AppNotificationConfigCopyWith<$Res> {
  _$AppNotificationConfigCopyWithImpl(this._self, this._then);

  final AppNotificationConfig _self;
  final $Res Function(AppNotificationConfig) _then;

/// Create a copy of AppNotificationConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxCount = null,Object? stepSizeOffset = null,Object? stepPositionOffset = null,Object? defaultDuration = null,Object? animationDuration = null,Object? animationCurve = null,}) {
  return _then(_self.copyWith(
maxCount: null == maxCount ? _self.maxCount : maxCount // ignore: cast_nullable_to_non_nullable
as int,stepSizeOffset: null == stepSizeOffset ? _self.stepSizeOffset : stepSizeOffset // ignore: cast_nullable_to_non_nullable
as Offset Function(int rank),stepPositionOffset: null == stepPositionOffset ? _self.stepPositionOffset : stepPositionOffset // ignore: cast_nullable_to_non_nullable
as Offset Function(int rank),defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,animationDuration: null == animationDuration ? _self.animationDuration : animationDuration // ignore: cast_nullable_to_non_nullable
as Duration,animationCurve: null == animationCurve ? _self.animationCurve : animationCurve // ignore: cast_nullable_to_non_nullable
as Curve,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotificationConfig].
extension AppNotificationConfigPatterns on AppNotificationConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxCount,  Offset Function(int rank) stepSizeOffset,  Offset Function(int rank) stepPositionOffset,  Duration defaultDuration,  Duration animationDuration,  Curve animationCurve)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationConfig() when $default != null:
return $default(_that.maxCount,_that.stepSizeOffset,_that.stepPositionOffset,_that.defaultDuration,_that.animationDuration,_that.animationCurve);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxCount,  Offset Function(int rank) stepSizeOffset,  Offset Function(int rank) stepPositionOffset,  Duration defaultDuration,  Duration animationDuration,  Curve animationCurve)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationConfig():
return $default(_that.maxCount,_that.stepSizeOffset,_that.stepPositionOffset,_that.defaultDuration,_that.animationDuration,_that.animationCurve);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxCount,  Offset Function(int rank) stepSizeOffset,  Offset Function(int rank) stepPositionOffset,  Duration defaultDuration,  Duration animationDuration,  Curve animationCurve)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationConfig() when $default != null:
return $default(_that.maxCount,_that.stepSizeOffset,_that.stepPositionOffset,_that.defaultDuration,_that.animationDuration,_that.animationCurve);case _:
  return null;

}
}

}

/// @nodoc


class _AppNotificationConfig implements AppNotificationConfig {
  const _AppNotificationConfig({this.maxCount = 5, this.stepSizeOffset = _defaultStepSizeOffset, this.stepPositionOffset = _defaultStepPositionOffset, this.defaultDuration = const Duration(seconds: 3), this.animationDuration = const Duration(milliseconds: 300), this.animationCurve = Curves.easeInOut});
  

@override@JsonKey() final  int maxCount;
@override@JsonKey() final  Offset Function(int rank) stepSizeOffset;
@override@JsonKey() final  Offset Function(int rank) stepPositionOffset;
@override@JsonKey() final  Duration defaultDuration;
@override@JsonKey() final  Duration animationDuration;
@override@JsonKey() final  Curve animationCurve;

/// Create a copy of AppNotificationConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationConfigCopyWith<_AppNotificationConfig> get copyWith => __$AppNotificationConfigCopyWithImpl<_AppNotificationConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationConfig&&(identical(other.maxCount, maxCount) || other.maxCount == maxCount)&&(identical(other.stepSizeOffset, stepSizeOffset) || other.stepSizeOffset == stepSizeOffset)&&(identical(other.stepPositionOffset, stepPositionOffset) || other.stepPositionOffset == stepPositionOffset)&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&(identical(other.animationDuration, animationDuration) || other.animationDuration == animationDuration)&&(identical(other.animationCurve, animationCurve) || other.animationCurve == animationCurve));
}


@override
int get hashCode => Object.hash(runtimeType,maxCount,stepSizeOffset,stepPositionOffset,defaultDuration,animationDuration,animationCurve);

@override
String toString() {
  return 'AppNotificationConfig(maxCount: $maxCount, stepSizeOffset: $stepSizeOffset, stepPositionOffset: $stepPositionOffset, defaultDuration: $defaultDuration, animationDuration: $animationDuration, animationCurve: $animationCurve)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationConfigCopyWith<$Res> implements $AppNotificationConfigCopyWith<$Res> {
  factory _$AppNotificationConfigCopyWith(_AppNotificationConfig value, $Res Function(_AppNotificationConfig) _then) = __$AppNotificationConfigCopyWithImpl;
@override @useResult
$Res call({
 int maxCount, Offset Function(int rank) stepSizeOffset, Offset Function(int rank) stepPositionOffset, Duration defaultDuration, Duration animationDuration, Curve animationCurve
});




}
/// @nodoc
class __$AppNotificationConfigCopyWithImpl<$Res>
    implements _$AppNotificationConfigCopyWith<$Res> {
  __$AppNotificationConfigCopyWithImpl(this._self, this._then);

  final _AppNotificationConfig _self;
  final $Res Function(_AppNotificationConfig) _then;

/// Create a copy of AppNotificationConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxCount = null,Object? stepSizeOffset = null,Object? stepPositionOffset = null,Object? defaultDuration = null,Object? animationDuration = null,Object? animationCurve = null,}) {
  return _then(_AppNotificationConfig(
maxCount: null == maxCount ? _self.maxCount : maxCount // ignore: cast_nullable_to_non_nullable
as int,stepSizeOffset: null == stepSizeOffset ? _self.stepSizeOffset : stepSizeOffset // ignore: cast_nullable_to_non_nullable
as Offset Function(int rank),stepPositionOffset: null == stepPositionOffset ? _self.stepPositionOffset : stepPositionOffset // ignore: cast_nullable_to_non_nullable
as Offset Function(int rank),defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,animationDuration: null == animationDuration ? _self.animationDuration : animationDuration // ignore: cast_nullable_to_non_nullable
as Duration,animationCurve: null == animationCurve ? _self.animationCurve : animationCurve // ignore: cast_nullable_to_non_nullable
as Curve,
  ));
}


}

// dart format on
