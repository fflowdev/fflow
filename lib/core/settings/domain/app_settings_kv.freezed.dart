// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_kv.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsKV<T> {

 String get key; T get value;
/// Create a copy of AppSettingsKV
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsKVCopyWith<T, AppSettingsKV<T>> get copyWith => _$AppSettingsKVCopyWithImpl<T, AppSettingsKV<T>>(this as AppSettingsKV<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsKV<T>&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AppSettingsKV<$T>(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $AppSettingsKVCopyWith<T,$Res>  {
  factory $AppSettingsKVCopyWith(AppSettingsKV<T> value, $Res Function(AppSettingsKV<T>) _then) = _$AppSettingsKVCopyWithImpl;
@useResult
$Res call({
 String key, T value
});




}
/// @nodoc
class _$AppSettingsKVCopyWithImpl<T,$Res>
    implements $AppSettingsKVCopyWith<T, $Res> {
  _$AppSettingsKVCopyWithImpl(this._self, this._then);

  final AppSettingsKV<T> _self;
  final $Res Function(AppSettingsKV<T>) _then;

/// Create a copy of AppSettingsKV
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsKV].
extension AppSettingsKVPatterns<T> on AppSettingsKV<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsKV<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsKV() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsKV<T> value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsKV():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsKV<T> value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsKV() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  T value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsKV() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  T value)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsKV():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  T value)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsKV() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettingsKV<T> implements AppSettingsKV<T> {
  const _AppSettingsKV({required this.key, required this.value});
  

@override final  String key;
@override final  T value;

/// Create a copy of AppSettingsKV
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsKVCopyWith<T, _AppSettingsKV<T>> get copyWith => __$AppSettingsKVCopyWithImpl<T, _AppSettingsKV<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsKV<T>&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,key,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'AppSettingsKV<$T>(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsKVCopyWith<T,$Res> implements $AppSettingsKVCopyWith<T, $Res> {
  factory _$AppSettingsKVCopyWith(_AppSettingsKV<T> value, $Res Function(_AppSettingsKV<T>) _then) = __$AppSettingsKVCopyWithImpl;
@override @useResult
$Res call({
 String key, T value
});




}
/// @nodoc
class __$AppSettingsKVCopyWithImpl<T,$Res>
    implements _$AppSettingsKVCopyWith<T, $Res> {
  __$AppSettingsKVCopyWithImpl(this._self, this._then);

  final _AppSettingsKV<T> _self;
  final $Res Function(_AppSettingsKV<T>) _then;

/// Create a copy of AppSettingsKV
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = freezed,}) {
  return _then(_AppSettingsKV<T>(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
