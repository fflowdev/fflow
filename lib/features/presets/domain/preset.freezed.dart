// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Preset {

 String get name; String get description; PresetCategory? get category; String get ffmpegArguments; bool get isFavorite; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Preset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetCopyWith<Preset> get copyWith => _$PresetCopyWithImpl<Preset>(this as Preset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Preset&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.ffmpegArguments, ffmpegArguments) || other.ffmpegArguments == ffmpegArguments)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,category,ffmpegArguments,isFavorite,createdAt,updatedAt);

@override
String toString() {
  return 'Preset(name: $name, description: $description, category: $category, ffmpegArguments: $ffmpegArguments, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PresetCopyWith<$Res>  {
  factory $PresetCopyWith(Preset value, $Res Function(Preset) _then) = _$PresetCopyWithImpl;
@useResult
$Res call({
 String name, String description, PresetCategory? category, String ffmpegArguments, bool isFavorite, DateTime? createdAt, DateTime? updatedAt
});


$PresetCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$PresetCopyWithImpl<$Res>
    implements $PresetCopyWith<$Res> {
  _$PresetCopyWithImpl(this._self, this._then);

  final Preset _self;
  final $Res Function(Preset) _then;

/// Create a copy of Preset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? category = freezed,Object? ffmpegArguments = null,Object? isFavorite = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PresetCategory?,ffmpegArguments: null == ffmpegArguments ? _self.ffmpegArguments : ffmpegArguments // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Preset
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


/// Adds pattern-matching-related methods to [Preset].
extension PresetPatterns on Preset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Preset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Preset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Preset value)  $default,){
final _that = this;
switch (_that) {
case _Preset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Preset value)?  $default,){
final _that = this;
switch (_that) {
case _Preset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  PresetCategory? category,  String ffmpegArguments,  bool isFavorite,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Preset() when $default != null:
return $default(_that.name,_that.description,_that.category,_that.ffmpegArguments,_that.isFavorite,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  PresetCategory? category,  String ffmpegArguments,  bool isFavorite,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Preset():
return $default(_that.name,_that.description,_that.category,_that.ffmpegArguments,_that.isFavorite,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  PresetCategory? category,  String ffmpegArguments,  bool isFavorite,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Preset() when $default != null:
return $default(_that.name,_that.description,_that.category,_that.ffmpegArguments,_that.isFavorite,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Preset implements Preset {
  const _Preset({required this.name, required this.description, this.category, required this.ffmpegArguments, this.isFavorite = false, this.createdAt, this.updatedAt});
  

@override final  String name;
@override final  String description;
@override final  PresetCategory? category;
@override final  String ffmpegArguments;
@override@JsonKey() final  bool isFavorite;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Preset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetCopyWith<_Preset> get copyWith => __$PresetCopyWithImpl<_Preset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preset&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.ffmpegArguments, ffmpegArguments) || other.ffmpegArguments == ffmpegArguments)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,category,ffmpegArguments,isFavorite,createdAt,updatedAt);

@override
String toString() {
  return 'Preset(name: $name, description: $description, category: $category, ffmpegArguments: $ffmpegArguments, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PresetCopyWith<$Res> implements $PresetCopyWith<$Res> {
  factory _$PresetCopyWith(_Preset value, $Res Function(_Preset) _then) = __$PresetCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, PresetCategory? category, String ffmpegArguments, bool isFavorite, DateTime? createdAt, DateTime? updatedAt
});


@override $PresetCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$PresetCopyWithImpl<$Res>
    implements _$PresetCopyWith<$Res> {
  __$PresetCopyWithImpl(this._self, this._then);

  final _Preset _self;
  final $Res Function(_Preset) _then;

/// Create a copy of Preset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? category = freezed,Object? ffmpegArguments = null,Object? isFavorite = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Preset(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PresetCategory?,ffmpegArguments: null == ffmpegArguments ? _self.ffmpegArguments : ffmpegArguments // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Preset
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
