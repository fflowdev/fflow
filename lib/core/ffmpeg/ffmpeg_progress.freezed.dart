// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ffmpeg_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FFmpegProgress {

 int? get frame; double? get fps; String? get bitrate; int? get totalSize;// bytes
 int? get outTimeMs; String? get speed; String? get progress;
/// Create a copy of FFmpegProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FFmpegProgressCopyWith<FFmpegProgress> get copyWith => _$FFmpegProgressCopyWithImpl<FFmpegProgress>(this as FFmpegProgress, _$identity);

  /// Serializes this FFmpegProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FFmpegProgress&&(identical(other.frame, frame) || other.frame == frame)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.outTimeMs, outTimeMs) || other.outTimeMs == outTimeMs)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frame,fps,bitrate,totalSize,outTimeMs,speed,progress);

@override
String toString() {
  return 'FFmpegProgress(frame: $frame, fps: $fps, bitrate: $bitrate, totalSize: $totalSize, outTimeMs: $outTimeMs, speed: $speed, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $FFmpegProgressCopyWith<$Res>  {
  factory $FFmpegProgressCopyWith(FFmpegProgress value, $Res Function(FFmpegProgress) _then) = _$FFmpegProgressCopyWithImpl;
@useResult
$Res call({
 int? frame, double? fps, String? bitrate, int? totalSize, int? outTimeMs, String? speed, String? progress
});




}
/// @nodoc
class _$FFmpegProgressCopyWithImpl<$Res>
    implements $FFmpegProgressCopyWith<$Res> {
  _$FFmpegProgressCopyWithImpl(this._self, this._then);

  final FFmpegProgress _self;
  final $Res Function(FFmpegProgress) _then;

/// Create a copy of FFmpegProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frame = freezed,Object? fps = freezed,Object? bitrate = freezed,Object? totalSize = freezed,Object? outTimeMs = freezed,Object? speed = freezed,Object? progress = freezed,}) {
  return _then(_self.copyWith(
frame: freezed == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as int?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as double?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,totalSize: freezed == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int?,outTimeMs: freezed == outTimeMs ? _self.outTimeMs : outTimeMs // ignore: cast_nullable_to_non_nullable
as int?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FFmpegProgress].
extension FFmpegProgressPatterns on FFmpegProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FFmpegProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FFmpegProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FFmpegProgress value)  $default,){
final _that = this;
switch (_that) {
case _FFmpegProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FFmpegProgress value)?  $default,){
final _that = this;
switch (_that) {
case _FFmpegProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? frame,  double? fps,  String? bitrate,  int? totalSize,  int? outTimeMs,  String? speed,  String? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FFmpegProgress() when $default != null:
return $default(_that.frame,_that.fps,_that.bitrate,_that.totalSize,_that.outTimeMs,_that.speed,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? frame,  double? fps,  String? bitrate,  int? totalSize,  int? outTimeMs,  String? speed,  String? progress)  $default,) {final _that = this;
switch (_that) {
case _FFmpegProgress():
return $default(_that.frame,_that.fps,_that.bitrate,_that.totalSize,_that.outTimeMs,_that.speed,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? frame,  double? fps,  String? bitrate,  int? totalSize,  int? outTimeMs,  String? speed,  String? progress)?  $default,) {final _that = this;
switch (_that) {
case _FFmpegProgress() when $default != null:
return $default(_that.frame,_that.fps,_that.bitrate,_that.totalSize,_that.outTimeMs,_that.speed,_that.progress);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [IntConverter(), DoubleConverter()])
class _FFmpegProgress extends FFmpegProgress {
  const _FFmpegProgress({required this.frame, required this.fps, required this.bitrate, required this.totalSize, required this.outTimeMs, required this.speed, required this.progress}): super._();
  factory _FFmpegProgress.fromJson(Map<String, dynamic> json) => _$FFmpegProgressFromJson(json);

@override final  int? frame;
@override final  double? fps;
@override final  String? bitrate;
@override final  int? totalSize;
// bytes
@override final  int? outTimeMs;
@override final  String? speed;
@override final  String? progress;

/// Create a copy of FFmpegProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FFmpegProgressCopyWith<_FFmpegProgress> get copyWith => __$FFmpegProgressCopyWithImpl<_FFmpegProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FFmpegProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FFmpegProgress&&(identical(other.frame, frame) || other.frame == frame)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize)&&(identical(other.outTimeMs, outTimeMs) || other.outTimeMs == outTimeMs)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frame,fps,bitrate,totalSize,outTimeMs,speed,progress);

@override
String toString() {
  return 'FFmpegProgress(frame: $frame, fps: $fps, bitrate: $bitrate, totalSize: $totalSize, outTimeMs: $outTimeMs, speed: $speed, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$FFmpegProgressCopyWith<$Res> implements $FFmpegProgressCopyWith<$Res> {
  factory _$FFmpegProgressCopyWith(_FFmpegProgress value, $Res Function(_FFmpegProgress) _then) = __$FFmpegProgressCopyWithImpl;
@override @useResult
$Res call({
 int? frame, double? fps, String? bitrate, int? totalSize, int? outTimeMs, String? speed, String? progress
});




}
/// @nodoc
class __$FFmpegProgressCopyWithImpl<$Res>
    implements _$FFmpegProgressCopyWith<$Res> {
  __$FFmpegProgressCopyWithImpl(this._self, this._then);

  final _FFmpegProgress _self;
  final $Res Function(_FFmpegProgress) _then;

/// Create a copy of FFmpegProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frame = freezed,Object? fps = freezed,Object? bitrate = freezed,Object? totalSize = freezed,Object? outTimeMs = freezed,Object? speed = freezed,Object? progress = freezed,}) {
  return _then(_FFmpegProgress(
frame: freezed == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as int?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as double?,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,totalSize: freezed == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int?,outTimeMs: freezed == outTimeMs ? _self.outTimeMs : outTimeMs // ignore: cast_nullable_to_non_nullable
as int?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as String?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
