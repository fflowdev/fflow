// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 String? get ffmpegPath; String? get ffprobePath; ThemeSettings get themeSettings;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.ffmpegPath, ffmpegPath) || other.ffmpegPath == ffmpegPath)&&(identical(other.ffprobePath, ffprobePath) || other.ffprobePath == ffprobePath)&&(identical(other.themeSettings, themeSettings) || other.themeSettings == themeSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ffmpegPath,ffprobePath,themeSettings);

@override
String toString() {
  return 'AppSettings(ffmpegPath: $ffmpegPath, ffprobePath: $ffprobePath, themeSettings: $themeSettings)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 String? ffmpegPath, String? ffprobePath, ThemeSettings themeSettings
});


$ThemeSettingsCopyWith<$Res> get themeSettings;

}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ffmpegPath = freezed,Object? ffprobePath = freezed,Object? themeSettings = null,}) {
  return _then(_self.copyWith(
ffmpegPath: freezed == ffmpegPath ? _self.ffmpegPath : ffmpegPath // ignore: cast_nullable_to_non_nullable
as String?,ffprobePath: freezed == ffprobePath ? _self.ffprobePath : ffprobePath // ignore: cast_nullable_to_non_nullable
as String?,themeSettings: null == themeSettings ? _self.themeSettings : themeSettings // ignore: cast_nullable_to_non_nullable
as ThemeSettings,
  ));
}
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get themeSettings {
  
  return $ThemeSettingsCopyWith<$Res>(_self.themeSettings, (value) {
    return _then(_self.copyWith(themeSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? ffmpegPath,  String? ffprobePath,  ThemeSettings themeSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.ffmpegPath,_that.ffprobePath,_that.themeSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? ffmpegPath,  String? ffprobePath,  ThemeSettings themeSettings)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.ffmpegPath,_that.ffprobePath,_that.themeSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? ffmpegPath,  String? ffprobePath,  ThemeSettings themeSettings)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.ffmpegPath,_that.ffprobePath,_that.themeSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({required this.ffmpegPath, required this.ffprobePath, required this.themeSettings});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override final  String? ffmpegPath;
@override final  String? ffprobePath;
@override final  ThemeSettings themeSettings;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.ffmpegPath, ffmpegPath) || other.ffmpegPath == ffmpegPath)&&(identical(other.ffprobePath, ffprobePath) || other.ffprobePath == ffprobePath)&&(identical(other.themeSettings, themeSettings) || other.themeSettings == themeSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ffmpegPath,ffprobePath,themeSettings);

@override
String toString() {
  return 'AppSettings(ffmpegPath: $ffmpegPath, ffprobePath: $ffprobePath, themeSettings: $themeSettings)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 String? ffmpegPath, String? ffprobePath, ThemeSettings themeSettings
});


@override $ThemeSettingsCopyWith<$Res> get themeSettings;

}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ffmpegPath = freezed,Object? ffprobePath = freezed,Object? themeSettings = null,}) {
  return _then(_AppSettings(
ffmpegPath: freezed == ffmpegPath ? _self.ffmpegPath : ffmpegPath // ignore: cast_nullable_to_non_nullable
as String?,ffprobePath: freezed == ffprobePath ? _self.ffprobePath : ffprobePath // ignore: cast_nullable_to_non_nullable
as String?,themeSettings: null == themeSettings ? _self.themeSettings : themeSettings // ignore: cast_nullable_to_non_nullable
as ThemeSettings,
  ));
}

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get themeSettings {
  
  return $ThemeSettingsCopyWith<$Res>(_self.themeSettings, (value) {
    return _then(_self.copyWith(themeSettings: value));
  });
}
}


/// @nodoc
mixin _$ThemeSettings {

 Color get primaryColor; bool get usePlatformSeedColor; ThemeMode get themeMode;
/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<ThemeSettings> get copyWith => _$ThemeSettingsCopyWithImpl<ThemeSettings>(this as ThemeSettings, _$identity);

  /// Serializes this ThemeSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeSettings&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.usePlatformSeedColor, usePlatformSeedColor) || other.usePlatformSeedColor == usePlatformSeedColor)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryColor,usePlatformSeedColor,themeMode);

@override
String toString() {
  return 'ThemeSettings(primaryColor: $primaryColor, usePlatformSeedColor: $usePlatformSeedColor, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $ThemeSettingsCopyWith<$Res>  {
  factory $ThemeSettingsCopyWith(ThemeSettings value, $Res Function(ThemeSettings) _then) = _$ThemeSettingsCopyWithImpl;
@useResult
$Res call({
 Color primaryColor, bool usePlatformSeedColor, ThemeMode themeMode
});




}
/// @nodoc
class _$ThemeSettingsCopyWithImpl<$Res>
    implements $ThemeSettingsCopyWith<$Res> {
  _$ThemeSettingsCopyWithImpl(this._self, this._then);

  final ThemeSettings _self;
  final $Res Function(ThemeSettings) _then;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryColor = null,Object? usePlatformSeedColor = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,usePlatformSeedColor: null == usePlatformSeedColor ? _self.usePlatformSeedColor : usePlatformSeedColor // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeSettings].
extension ThemeSettingsPatterns on ThemeSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeSettings value)  $default,){
final _that = this;
switch (_that) {
case _ThemeSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color primaryColor,  bool usePlatformSeedColor,  ThemeMode themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
return $default(_that.primaryColor,_that.usePlatformSeedColor,_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color primaryColor,  bool usePlatformSeedColor,  ThemeMode themeMode)  $default,) {final _that = this;
switch (_that) {
case _ThemeSettings():
return $default(_that.primaryColor,_that.usePlatformSeedColor,_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color primaryColor,  bool usePlatformSeedColor,  ThemeMode themeMode)?  $default,) {final _that = this;
switch (_that) {
case _ThemeSettings() when $default != null:
return $default(_that.primaryColor,_that.usePlatformSeedColor,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [ColorConverter()])
class _ThemeSettings extends ThemeSettings {
  const _ThemeSettings({required this.primaryColor, required this.usePlatformSeedColor, required this.themeMode}): super._();
  factory _ThemeSettings.fromJson(Map<String, dynamic> json) => _$ThemeSettingsFromJson(json);

@override final  Color primaryColor;
@override final  bool usePlatformSeedColor;
@override final  ThemeMode themeMode;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeSettingsCopyWith<_ThemeSettings> get copyWith => __$ThemeSettingsCopyWithImpl<_ThemeSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeSettings&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.usePlatformSeedColor, usePlatformSeedColor) || other.usePlatformSeedColor == usePlatformSeedColor)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryColor,usePlatformSeedColor,themeMode);

@override
String toString() {
  return 'ThemeSettings(primaryColor: $primaryColor, usePlatformSeedColor: $usePlatformSeedColor, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$ThemeSettingsCopyWith<$Res> implements $ThemeSettingsCopyWith<$Res> {
  factory _$ThemeSettingsCopyWith(_ThemeSettings value, $Res Function(_ThemeSettings) _then) = __$ThemeSettingsCopyWithImpl;
@override @useResult
$Res call({
 Color primaryColor, bool usePlatformSeedColor, ThemeMode themeMode
});




}
/// @nodoc
class __$ThemeSettingsCopyWithImpl<$Res>
    implements _$ThemeSettingsCopyWith<$Res> {
  __$ThemeSettingsCopyWithImpl(this._self, this._then);

  final _ThemeSettings _self;
  final $Res Function(_ThemeSettings) _then;

/// Create a copy of ThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryColor = null,Object? usePlatformSeedColor = null,Object? themeMode = null,}) {
  return _then(_ThemeSettings(
primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as Color,usePlatformSeedColor: null == usePlatformSeedColor ? _self.usePlatformSeedColor : usePlatformSeedColor // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
