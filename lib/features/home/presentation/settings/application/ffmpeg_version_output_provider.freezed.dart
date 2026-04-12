// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ffmpeg_version_output_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FfmpegVersionOutputResult implements DiagnosticableTreeMixin {

 String get output; int get exitCode;
/// Create a copy of FfmpegVersionOutputResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FfmpegVersionOutputResultCopyWith<FfmpegVersionOutputResult> get copyWith => _$FfmpegVersionOutputResultCopyWithImpl<FfmpegVersionOutputResult>(this as FfmpegVersionOutputResult, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FfmpegVersionOutputResult'))
    ..add(DiagnosticsProperty('output', output))..add(DiagnosticsProperty('exitCode', exitCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FfmpegVersionOutputResult&&(identical(other.output, output) || other.output == output)&&(identical(other.exitCode, exitCode) || other.exitCode == exitCode));
}


@override
int get hashCode => Object.hash(runtimeType,output,exitCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FfmpegVersionOutputResult(output: $output, exitCode: $exitCode)';
}


}

/// @nodoc
abstract mixin class $FfmpegVersionOutputResultCopyWith<$Res>  {
  factory $FfmpegVersionOutputResultCopyWith(FfmpegVersionOutputResult value, $Res Function(FfmpegVersionOutputResult) _then) = _$FfmpegVersionOutputResultCopyWithImpl;
@useResult
$Res call({
 String output, int exitCode
});




}
/// @nodoc
class _$FfmpegVersionOutputResultCopyWithImpl<$Res>
    implements $FfmpegVersionOutputResultCopyWith<$Res> {
  _$FfmpegVersionOutputResultCopyWithImpl(this._self, this._then);

  final FfmpegVersionOutputResult _self;
  final $Res Function(FfmpegVersionOutputResult) _then;

/// Create a copy of FfmpegVersionOutputResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? output = null,Object? exitCode = null,}) {
  return _then(_self.copyWith(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as String,exitCode: null == exitCode ? _self.exitCode : exitCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FfmpegVersionOutputResult].
extension FfmpegVersionOutputResultPatterns on FfmpegVersionOutputResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FfmpegVersionOutputResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FfmpegVersionOutputResult value)  $default,){
final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FfmpegVersionOutputResult value)?  $default,){
final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String output,  int exitCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult() when $default != null:
return $default(_that.output,_that.exitCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String output,  int exitCode)  $default,) {final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult():
return $default(_that.output,_that.exitCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String output,  int exitCode)?  $default,) {final _that = this;
switch (_that) {
case _FfmpegVersionOutputResult() when $default != null:
return $default(_that.output,_that.exitCode);case _:
  return null;

}
}

}

/// @nodoc


class _FfmpegVersionOutputResult extends FfmpegVersionOutputResult with DiagnosticableTreeMixin {
  const _FfmpegVersionOutputResult({required this.output, required this.exitCode}): super._();
  

@override final  String output;
@override final  int exitCode;

/// Create a copy of FfmpegVersionOutputResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FfmpegVersionOutputResultCopyWith<_FfmpegVersionOutputResult> get copyWith => __$FfmpegVersionOutputResultCopyWithImpl<_FfmpegVersionOutputResult>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FfmpegVersionOutputResult'))
    ..add(DiagnosticsProperty('output', output))..add(DiagnosticsProperty('exitCode', exitCode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FfmpegVersionOutputResult&&(identical(other.output, output) || other.output == output)&&(identical(other.exitCode, exitCode) || other.exitCode == exitCode));
}


@override
int get hashCode => Object.hash(runtimeType,output,exitCode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FfmpegVersionOutputResult(output: $output, exitCode: $exitCode)';
}


}

/// @nodoc
abstract mixin class _$FfmpegVersionOutputResultCopyWith<$Res> implements $FfmpegVersionOutputResultCopyWith<$Res> {
  factory _$FfmpegVersionOutputResultCopyWith(_FfmpegVersionOutputResult value, $Res Function(_FfmpegVersionOutputResult) _then) = __$FfmpegVersionOutputResultCopyWithImpl;
@override @useResult
$Res call({
 String output, int exitCode
});




}
/// @nodoc
class __$FfmpegVersionOutputResultCopyWithImpl<$Res>
    implements _$FfmpegVersionOutputResultCopyWith<$Res> {
  __$FfmpegVersionOutputResultCopyWithImpl(this._self, this._then);

  final _FfmpegVersionOutputResult _self;
  final $Res Function(_FfmpegVersionOutputResult) _then;

/// Create a copy of FfmpegVersionOutputResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? output = null,Object? exitCode = null,}) {
  return _then(_FfmpegVersionOutputResult(
output: null == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as String,exitCode: null == exitCode ? _self.exitCode : exitCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
