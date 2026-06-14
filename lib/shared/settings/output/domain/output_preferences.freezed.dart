// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'output_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutputPreferences {

 String get outputDirectoryPath;
/// Create a copy of OutputPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputPreferencesCopyWith<OutputPreferences> get copyWith => _$OutputPreferencesCopyWithImpl<OutputPreferences>(this as OutputPreferences, _$identity);

  /// Serializes this OutputPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputPreferences&&(identical(other.outputDirectoryPath, outputDirectoryPath) || other.outputDirectoryPath == outputDirectoryPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputDirectoryPath);

@override
String toString() {
  return 'OutputPreferences(outputDirectoryPath: $outputDirectoryPath)';
}


}

/// @nodoc
abstract mixin class $OutputPreferencesCopyWith<$Res>  {
  factory $OutputPreferencesCopyWith(OutputPreferences value, $Res Function(OutputPreferences) _then) = _$OutputPreferencesCopyWithImpl;
@useResult
$Res call({
 String outputDirectoryPath
});




}
/// @nodoc
class _$OutputPreferencesCopyWithImpl<$Res>
    implements $OutputPreferencesCopyWith<$Res> {
  _$OutputPreferencesCopyWithImpl(this._self, this._then);

  final OutputPreferences _self;
  final $Res Function(OutputPreferences) _then;

/// Create a copy of OutputPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outputDirectoryPath = null,}) {
  return _then(_self.copyWith(
outputDirectoryPath: null == outputDirectoryPath ? _self.outputDirectoryPath : outputDirectoryPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OutputPreferences].
extension OutputPreferencesPatterns on OutputPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutputPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutputPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutputPreferences value)  $default,){
final _that = this;
switch (_that) {
case _OutputPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutputPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _OutputPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String outputDirectoryPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutputPreferences() when $default != null:
return $default(_that.outputDirectoryPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String outputDirectoryPath)  $default,) {final _that = this;
switch (_that) {
case _OutputPreferences():
return $default(_that.outputDirectoryPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String outputDirectoryPath)?  $default,) {final _that = this;
switch (_that) {
case _OutputPreferences() when $default != null:
return $default(_that.outputDirectoryPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutputPreferences implements OutputPreferences {
  const _OutputPreferences({required this.outputDirectoryPath});
  factory _OutputPreferences.fromJson(Map<String, dynamic> json) => _$OutputPreferencesFromJson(json);

@override final  String outputDirectoryPath;

/// Create a copy of OutputPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutputPreferencesCopyWith<_OutputPreferences> get copyWith => __$OutputPreferencesCopyWithImpl<_OutputPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutputPreferences&&(identical(other.outputDirectoryPath, outputDirectoryPath) || other.outputDirectoryPath == outputDirectoryPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,outputDirectoryPath);

@override
String toString() {
  return 'OutputPreferences(outputDirectoryPath: $outputDirectoryPath)';
}


}

/// @nodoc
abstract mixin class _$OutputPreferencesCopyWith<$Res> implements $OutputPreferencesCopyWith<$Res> {
  factory _$OutputPreferencesCopyWith(_OutputPreferences value, $Res Function(_OutputPreferences) _then) = __$OutputPreferencesCopyWithImpl;
@override @useResult
$Res call({
 String outputDirectoryPath
});




}
/// @nodoc
class __$OutputPreferencesCopyWithImpl<$Res>
    implements _$OutputPreferencesCopyWith<$Res> {
  __$OutputPreferencesCopyWithImpl(this._self, this._then);

  final _OutputPreferences _self;
  final $Res Function(_OutputPreferences) _then;

/// Create a copy of OutputPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outputDirectoryPath = null,}) {
  return _then(_OutputPreferences(
outputDirectoryPath: null == outputDirectoryPath ? _self.outputDirectoryPath : outputDirectoryPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
