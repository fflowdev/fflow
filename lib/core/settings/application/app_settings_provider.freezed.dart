// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsNotifierArguments<DataT extends Object,ValueT> {

 String get key; ValueT Function(DataT data) get valueBuilder; DataT Function(ValueT value) get dataBuilder;
/// Create a copy of AppSettingsNotifierArguments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsNotifierArgumentsCopyWith<DataT, ValueT, AppSettingsNotifierArguments<DataT, ValueT>> get copyWith => _$AppSettingsNotifierArgumentsCopyWithImpl<DataT, ValueT, AppSettingsNotifierArguments<DataT, ValueT>>(this as AppSettingsNotifierArguments<DataT, ValueT>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsNotifierArguments<DataT, ValueT>&&(identical(other.key, key) || other.key == key)&&(identical(other.valueBuilder, valueBuilder) || other.valueBuilder == valueBuilder)&&(identical(other.dataBuilder, dataBuilder) || other.dataBuilder == dataBuilder));
}


@override
int get hashCode => Object.hash(runtimeType,key,valueBuilder,dataBuilder);

@override
String toString() {
  return 'AppSettingsNotifierArguments<$DataT, $ValueT>(key: $key, valueBuilder: $valueBuilder, dataBuilder: $dataBuilder)';
}


}

/// @nodoc
abstract mixin class $AppSettingsNotifierArgumentsCopyWith<DataT extends Object,ValueT,$Res>  {
  factory $AppSettingsNotifierArgumentsCopyWith(AppSettingsNotifierArguments<DataT, ValueT> value, $Res Function(AppSettingsNotifierArguments<DataT, ValueT>) _then) = _$AppSettingsNotifierArgumentsCopyWithImpl;
@useResult
$Res call({
 String key, ValueT Function(DataT data) valueBuilder, DataT Function(ValueT value) dataBuilder
});




}
/// @nodoc
class _$AppSettingsNotifierArgumentsCopyWithImpl<DataT extends Object,ValueT,$Res>
    implements $AppSettingsNotifierArgumentsCopyWith<DataT, ValueT, $Res> {
  _$AppSettingsNotifierArgumentsCopyWithImpl(this._self, this._then);

  final AppSettingsNotifierArguments<DataT, ValueT> _self;
  final $Res Function(AppSettingsNotifierArguments<DataT, ValueT>) _then;

/// Create a copy of AppSettingsNotifierArguments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? valueBuilder = null,Object? dataBuilder = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,valueBuilder: null == valueBuilder ? _self.valueBuilder : valueBuilder // ignore: cast_nullable_to_non_nullable
as ValueT Function(DataT data),dataBuilder: null == dataBuilder ? _self.dataBuilder : dataBuilder // ignore: cast_nullable_to_non_nullable
as DataT Function(ValueT value),
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsNotifierArguments].
extension AppSettingsNotifierArgumentsPatterns<DataT extends Object,ValueT> on AppSettingsNotifierArguments<DataT, ValueT> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsNotifierArguments<DataT, ValueT> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsNotifierArguments<DataT, ValueT> value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsNotifierArguments<DataT, ValueT> value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  ValueT Function(DataT data) valueBuilder,  DataT Function(ValueT value) dataBuilder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments() when $default != null:
return $default(_that.key,_that.valueBuilder,_that.dataBuilder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  ValueT Function(DataT data) valueBuilder,  DataT Function(ValueT value) dataBuilder)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments():
return $default(_that.key,_that.valueBuilder,_that.dataBuilder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  ValueT Function(DataT data) valueBuilder,  DataT Function(ValueT value) dataBuilder)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsNotifierArguments() when $default != null:
return $default(_that.key,_that.valueBuilder,_that.dataBuilder);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettingsNotifierArguments<DataT extends Object,ValueT> implements AppSettingsNotifierArguments<DataT, ValueT> {
  const _AppSettingsNotifierArguments({required this.key, required this.valueBuilder, required this.dataBuilder});
  

@override final  String key;
@override final  ValueT Function(DataT data) valueBuilder;
@override final  DataT Function(ValueT value) dataBuilder;

/// Create a copy of AppSettingsNotifierArguments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsNotifierArgumentsCopyWith<DataT, ValueT, _AppSettingsNotifierArguments<DataT, ValueT>> get copyWith => __$AppSettingsNotifierArgumentsCopyWithImpl<DataT, ValueT, _AppSettingsNotifierArguments<DataT, ValueT>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsNotifierArguments<DataT, ValueT>&&(identical(other.key, key) || other.key == key)&&(identical(other.valueBuilder, valueBuilder) || other.valueBuilder == valueBuilder)&&(identical(other.dataBuilder, dataBuilder) || other.dataBuilder == dataBuilder));
}


@override
int get hashCode => Object.hash(runtimeType,key,valueBuilder,dataBuilder);

@override
String toString() {
  return 'AppSettingsNotifierArguments<$DataT, $ValueT>(key: $key, valueBuilder: $valueBuilder, dataBuilder: $dataBuilder)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsNotifierArgumentsCopyWith<DataT extends Object,ValueT,$Res> implements $AppSettingsNotifierArgumentsCopyWith<DataT, ValueT, $Res> {
  factory _$AppSettingsNotifierArgumentsCopyWith(_AppSettingsNotifierArguments<DataT, ValueT> value, $Res Function(_AppSettingsNotifierArguments<DataT, ValueT>) _then) = __$AppSettingsNotifierArgumentsCopyWithImpl;
@override @useResult
$Res call({
 String key, ValueT Function(DataT data) valueBuilder, DataT Function(ValueT value) dataBuilder
});




}
/// @nodoc
class __$AppSettingsNotifierArgumentsCopyWithImpl<DataT extends Object,ValueT,$Res>
    implements _$AppSettingsNotifierArgumentsCopyWith<DataT, ValueT, $Res> {
  __$AppSettingsNotifierArgumentsCopyWithImpl(this._self, this._then);

  final _AppSettingsNotifierArguments<DataT, ValueT> _self;
  final $Res Function(_AppSettingsNotifierArguments<DataT, ValueT>) _then;

/// Create a copy of AppSettingsNotifierArguments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? valueBuilder = null,Object? dataBuilder = null,}) {
  return _then(_AppSettingsNotifierArguments<DataT, ValueT>(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,valueBuilder: null == valueBuilder ? _self.valueBuilder : valueBuilder // ignore: cast_nullable_to_non_nullable
as ValueT Function(DataT data),dataBuilder: null == dataBuilder ? _self.dataBuilder : dataBuilder // ignore: cast_nullable_to_non_nullable
as DataT Function(ValueT value),
  ));
}


}

// dart format on
