// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ffmpeg_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FfmpegSettings {

 String get ffmpegExecutablePath;
/// Create a copy of FfmpegSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FfmpegSettingsCopyWith<FfmpegSettings> get copyWith => _$FfmpegSettingsCopyWithImpl<FfmpegSettings>(this as FfmpegSettings, _$identity);

  /// Serializes this FfmpegSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FfmpegSettings&&(identical(other.ffmpegExecutablePath, ffmpegExecutablePath) || other.ffmpegExecutablePath == ffmpegExecutablePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ffmpegExecutablePath);

@override
String toString() {
  return 'FfmpegSettings(ffmpegExecutablePath: $ffmpegExecutablePath)';
}


}

/// @nodoc
abstract mixin class $FfmpegSettingsCopyWith<$Res>  {
  factory $FfmpegSettingsCopyWith(FfmpegSettings value, $Res Function(FfmpegSettings) _then) = _$FfmpegSettingsCopyWithImpl;
@useResult
$Res call({
 String ffmpegExecutablePath
});




}
/// @nodoc
class _$FfmpegSettingsCopyWithImpl<$Res>
    implements $FfmpegSettingsCopyWith<$Res> {
  _$FfmpegSettingsCopyWithImpl(this._self, this._then);

  final FfmpegSettings _self;
  final $Res Function(FfmpegSettings) _then;

/// Create a copy of FfmpegSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ffmpegExecutablePath = null,}) {
  return _then(_self.copyWith(
ffmpegExecutablePath: null == ffmpegExecutablePath ? _self.ffmpegExecutablePath : ffmpegExecutablePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FfmpegSettings].
extension FfmpegSettingsPatterns on FfmpegSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FfmpegSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FfmpegSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FfmpegSettings value)  $default,){
final _that = this;
switch (_that) {
case _FfmpegSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FfmpegSettings value)?  $default,){
final _that = this;
switch (_that) {
case _FfmpegSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ffmpegExecutablePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FfmpegSettings() when $default != null:
return $default(_that.ffmpegExecutablePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ffmpegExecutablePath)  $default,) {final _that = this;
switch (_that) {
case _FfmpegSettings():
return $default(_that.ffmpegExecutablePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ffmpegExecutablePath)?  $default,) {final _that = this;
switch (_that) {
case _FfmpegSettings() when $default != null:
return $default(_that.ffmpegExecutablePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FfmpegSettings implements FfmpegSettings {
  const _FfmpegSettings({required this.ffmpegExecutablePath});
  factory _FfmpegSettings.fromJson(Map<String, dynamic> json) => _$FfmpegSettingsFromJson(json);

@override final  String ffmpegExecutablePath;

/// Create a copy of FfmpegSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FfmpegSettingsCopyWith<_FfmpegSettings> get copyWith => __$FfmpegSettingsCopyWithImpl<_FfmpegSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FfmpegSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FfmpegSettings&&(identical(other.ffmpegExecutablePath, ffmpegExecutablePath) || other.ffmpegExecutablePath == ffmpegExecutablePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ffmpegExecutablePath);

@override
String toString() {
  return 'FfmpegSettings(ffmpegExecutablePath: $ffmpegExecutablePath)';
}


}

/// @nodoc
abstract mixin class _$FfmpegSettingsCopyWith<$Res> implements $FfmpegSettingsCopyWith<$Res> {
  factory _$FfmpegSettingsCopyWith(_FfmpegSettings value, $Res Function(_FfmpegSettings) _then) = __$FfmpegSettingsCopyWithImpl;
@override @useResult
$Res call({
 String ffmpegExecutablePath
});




}
/// @nodoc
class __$FfmpegSettingsCopyWithImpl<$Res>
    implements _$FfmpegSettingsCopyWith<$Res> {
  __$FfmpegSettingsCopyWithImpl(this._self, this._then);

  final _FfmpegSettings _self;
  final $Res Function(_FfmpegSettings) _then;

/// Create a copy of FfmpegSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ffmpegExecutablePath = null,}) {
  return _then(_FfmpegSettings(
ffmpegExecutablePath: null == ffmpegExecutablePath ? _self.ffmpegExecutablePath : ffmpegExecutablePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
