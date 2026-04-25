// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presets_query_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresetsQueryArguments {

 PresetCategory? get category; String? get queryName;
/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetsQueryArgumentsCopyWith<PresetsQueryArguments> get copyWith => _$PresetsQueryArgumentsCopyWithImpl<PresetsQueryArguments>(this as PresetsQueryArguments, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetsQueryArguments&&(identical(other.category, category) || other.category == category)&&(identical(other.queryName, queryName) || other.queryName == queryName));
}


@override
int get hashCode => Object.hash(runtimeType,category,queryName);

@override
String toString() {
  return 'PresetsQueryArguments(category: $category, queryName: $queryName)';
}


}

/// @nodoc
abstract mixin class $PresetsQueryArgumentsCopyWith<$Res>  {
  factory $PresetsQueryArgumentsCopyWith(PresetsQueryArguments value, $Res Function(PresetsQueryArguments) _then) = _$PresetsQueryArgumentsCopyWithImpl;
@useResult
$Res call({
 PresetCategory? category, String? queryName
});


$PresetCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$PresetsQueryArgumentsCopyWithImpl<$Res>
    implements $PresetsQueryArgumentsCopyWith<$Res> {
  _$PresetsQueryArgumentsCopyWithImpl(this._self, this._then);

  final PresetsQueryArguments _self;
  final $Res Function(PresetsQueryArguments) _then;

/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? queryName = freezed,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PresetCategory?,queryName: freezed == queryName ? _self.queryName : queryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresetCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $PresetCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresetsQueryArguments].
extension PresetsQueryArgumentsPatterns on PresetsQueryArguments {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresetsQueryArguments value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresetsQueryArguments() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresetsQueryArguments value)  $default,){
final _that = this;
switch (_that) {
case _PresetsQueryArguments():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresetsQueryArguments value)?  $default,){
final _that = this;
switch (_that) {
case _PresetsQueryArguments() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PresetCategory? category,  String? queryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresetsQueryArguments() when $default != null:
return $default(_that.category,_that.queryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PresetCategory? category,  String? queryName)  $default,) {final _that = this;
switch (_that) {
case _PresetsQueryArguments():
return $default(_that.category,_that.queryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PresetCategory? category,  String? queryName)?  $default,) {final _that = this;
switch (_that) {
case _PresetsQueryArguments() when $default != null:
return $default(_that.category,_that.queryName);case _:
  return null;

}
}

}

/// @nodoc


class _PresetsQueryArguments implements PresetsQueryArguments {
  const _PresetsQueryArguments({this.category, this.queryName});
  

@override final  PresetCategory? category;
@override final  String? queryName;

/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetsQueryArgumentsCopyWith<_PresetsQueryArguments> get copyWith => __$PresetsQueryArgumentsCopyWithImpl<_PresetsQueryArguments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetsQueryArguments&&(identical(other.category, category) || other.category == category)&&(identical(other.queryName, queryName) || other.queryName == queryName));
}


@override
int get hashCode => Object.hash(runtimeType,category,queryName);

@override
String toString() {
  return 'PresetsQueryArguments(category: $category, queryName: $queryName)';
}


}

/// @nodoc
abstract mixin class _$PresetsQueryArgumentsCopyWith<$Res> implements $PresetsQueryArgumentsCopyWith<$Res> {
  factory _$PresetsQueryArgumentsCopyWith(_PresetsQueryArguments value, $Res Function(_PresetsQueryArguments) _then) = __$PresetsQueryArgumentsCopyWithImpl;
@override @useResult
$Res call({
 PresetCategory? category, String? queryName
});


@override $PresetCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$PresetsQueryArgumentsCopyWithImpl<$Res>
    implements _$PresetsQueryArgumentsCopyWith<$Res> {
  __$PresetsQueryArgumentsCopyWithImpl(this._self, this._then);

  final _PresetsQueryArguments _self;
  final $Res Function(_PresetsQueryArguments) _then;

/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? queryName = freezed,}) {
  return _then(_PresetsQueryArguments(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PresetCategory?,queryName: freezed == queryName ? _self.queryName : queryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PresetsQueryArguments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresetCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $PresetCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
