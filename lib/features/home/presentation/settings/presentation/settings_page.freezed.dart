// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListTile {

 VoidCallback? get onTap;
/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListTileCopyWith<_ListTile> get copyWith => __$ListTileCopyWithImpl<_ListTile>(this as _ListTile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListTile&&(identical(other.onTap, onTap) || other.onTap == onTap));
}


@override
int get hashCode => Object.hash(runtimeType,onTap);

@override
String toString() {
  return '_ListTile(onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class _$ListTileCopyWith<$Res>  {
  factory _$ListTileCopyWith(_ListTile value, $Res Function(_ListTile) _then) = __$ListTileCopyWithImpl;
@useResult
$Res call({
 void Function()? onTap
});




}
/// @nodoc
class __$ListTileCopyWithImpl<$Res>
    implements _$ListTileCopyWith<$Res> {
  __$ListTileCopyWithImpl(this._self, this._then);

  final _ListTile _self;
  final $Res Function(_ListTile) _then;

/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onTap = freezed,}) {
  return _then(_self.copyWith(
onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as void Function()?,
  ));
}

}


/// Adds pattern-matching-related methods to [_ListTile].
extension _ListTilePatterns on _ListTile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PresetListTile value)?  preset,TResult Function( _CustomListTile value)?  custom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresetListTile() when preset != null:
return preset(_that);case _CustomListTile() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PresetListTile value)  preset,required TResult Function( _CustomListTile value)  custom,}){
final _that = this;
switch (_that) {
case _PresetListTile():
return preset(_that);case _CustomListTile():
return custom(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PresetListTile value)?  preset,TResult? Function( _CustomListTile value)?  custom,}){
final _that = this;
switch (_that) {
case _PresetListTile() when preset != null:
return preset(_that);case _CustomListTile() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( IconData icon,  String title,  String? subtitle,  Widget? trailing,  VoidCallback? onTap)?  preset,TResult Function( VoidCallback? onTap,  Widget child)?  custom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresetListTile() when preset != null:
return preset(_that.icon,_that.title,_that.subtitle,_that.trailing,_that.onTap);case _CustomListTile() when custom != null:
return custom(_that.onTap,_that.child);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( IconData icon,  String title,  String? subtitle,  Widget? trailing,  VoidCallback? onTap)  preset,required TResult Function( VoidCallback? onTap,  Widget child)  custom,}) {final _that = this;
switch (_that) {
case _PresetListTile():
return preset(_that.icon,_that.title,_that.subtitle,_that.trailing,_that.onTap);case _CustomListTile():
return custom(_that.onTap,_that.child);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( IconData icon,  String title,  String? subtitle,  Widget? trailing,  VoidCallback? onTap)?  preset,TResult? Function( VoidCallback? onTap,  Widget child)?  custom,}) {final _that = this;
switch (_that) {
case _PresetListTile() when preset != null:
return preset(_that.icon,_that.title,_that.subtitle,_that.trailing,_that.onTap);case _CustomListTile() when custom != null:
return custom(_that.onTap,_that.child);case _:
  return null;

}
}

}

/// @nodoc


class _PresetListTile implements _ListTile {
  const _PresetListTile({required this.icon, required this.title, this.subtitle, this.trailing, this.onTap});
  

 final  IconData icon;
 final  String title;
 final  String? subtitle;
 final  Widget? trailing;
@override final  VoidCallback? onTap;

/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetListTileCopyWith<_PresetListTile> get copyWith => __$PresetListTileCopyWithImpl<_PresetListTile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetListTile&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.trailing, trailing) || other.trailing == trailing)&&(identical(other.onTap, onTap) || other.onTap == onTap));
}


@override
int get hashCode => Object.hash(runtimeType,icon,title,subtitle,trailing,onTap);

@override
String toString() {
  return '_ListTile.preset(icon: $icon, title: $title, subtitle: $subtitle, trailing: $trailing, onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class _$PresetListTileCopyWith<$Res> implements _$ListTileCopyWith<$Res> {
  factory _$PresetListTileCopyWith(_PresetListTile value, $Res Function(_PresetListTile) _then) = __$PresetListTileCopyWithImpl;
@override @useResult
$Res call({
 IconData icon, String title, String? subtitle, Widget? trailing, VoidCallback? onTap
});




}
/// @nodoc
class __$PresetListTileCopyWithImpl<$Res>
    implements _$PresetListTileCopyWith<$Res> {
  __$PresetListTileCopyWithImpl(this._self, this._then);

  final _PresetListTile _self;
  final $Res Function(_PresetListTile) _then;

/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? title = null,Object? subtitle = freezed,Object? trailing = freezed,Object? onTap = freezed,}) {
  return _then(_PresetListTile(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,trailing: freezed == trailing ? _self.trailing : trailing // ignore: cast_nullable_to_non_nullable
as Widget?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

/// @nodoc


class _CustomListTile implements _ListTile {
  const _CustomListTile({this.onTap, required this.child});
  

@override final  VoidCallback? onTap;
 final  Widget child;

/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomListTileCopyWith<_CustomListTile> get copyWith => __$CustomListTileCopyWithImpl<_CustomListTile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomListTile&&(identical(other.onTap, onTap) || other.onTap == onTap)&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,onTap,child);

@override
String toString() {
  return '_ListTile.custom(onTap: $onTap, child: $child)';
}


}

/// @nodoc
abstract mixin class _$CustomListTileCopyWith<$Res> implements _$ListTileCopyWith<$Res> {
  factory _$CustomListTileCopyWith(_CustomListTile value, $Res Function(_CustomListTile) _then) = __$CustomListTileCopyWithImpl;
@override @useResult
$Res call({
 VoidCallback? onTap, Widget child
});




}
/// @nodoc
class __$CustomListTileCopyWithImpl<$Res>
    implements _$CustomListTileCopyWith<$Res> {
  __$CustomListTileCopyWithImpl(this._self, this._then);

  final _CustomListTile _self;
  final $Res Function(_CustomListTile) _then;

/// Create a copy of _ListTile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onTap = freezed,Object? child = null,}) {
  return _then(_CustomListTile(
onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback?,child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

// dart format on
