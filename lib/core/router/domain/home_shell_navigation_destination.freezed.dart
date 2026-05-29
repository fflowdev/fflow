// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_shell_navigation_destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeShellNavigationDestination {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeShellNavigationDestination);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeShellNavigationDestination()';
}


}

/// @nodoc
class $HomeShellNavigationDestinationCopyWith<$Res>  {
$HomeShellNavigationDestinationCopyWith(HomeShellNavigationDestination _, $Res Function(HomeShellNavigationDestination) __);
}


/// Adds pattern-matching-related methods to [HomeShellNavigationDestination].
extension HomeShellNavigationDestinationPatterns on HomeShellNavigationDestination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeShellNavigationDestinationItem value)?  item,TResult Function( HomeShellNavigationDestinationDivider value)?  divider,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem() when item != null:
return item(_that);case HomeShellNavigationDestinationDivider() when divider != null:
return divider(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeShellNavigationDestinationItem value)  item,required TResult Function( HomeShellNavigationDestinationDivider value)  divider,}){
final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem():
return item(_that);case HomeShellNavigationDestinationDivider():
return divider(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeShellNavigationDestinationItem value)?  item,TResult? Function( HomeShellNavigationDestinationDivider value)?  divider,}){
final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem() when item != null:
return item(_that);case HomeShellNavigationDestinationDivider() when divider != null:
return divider(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String label,  IconData icon,  IconData selectedIcon,  GoRouteData route)?  item,TResult Function()?  divider,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem() when item != null:
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomeShellNavigationDestinationDivider() when divider != null:
return divider();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String label,  IconData icon,  IconData selectedIcon,  GoRouteData route)  item,required TResult Function()  divider,}) {final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem():
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomeShellNavigationDestinationDivider():
return divider();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String label,  IconData icon,  IconData selectedIcon,  GoRouteData route)?  item,TResult? Function()?  divider,}) {final _that = this;
switch (_that) {
case HomeShellNavigationDestinationItem() when item != null:
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomeShellNavigationDestinationDivider() when divider != null:
return divider();case _:
  return null;

}
}

}

/// @nodoc


class HomeShellNavigationDestinationItem implements HomeShellNavigationDestination {
  const HomeShellNavigationDestinationItem(this.label, this.icon, this.selectedIcon, this.route);
  

 final  String label;
 final  IconData icon;
 final  IconData selectedIcon;
 final  GoRouteData route;

/// Create a copy of HomeShellNavigationDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeShellNavigationDestinationItemCopyWith<HomeShellNavigationDestinationItem> get copyWith => _$HomeShellNavigationDestinationItemCopyWithImpl<HomeShellNavigationDestinationItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeShellNavigationDestinationItem&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.selectedIcon, selectedIcon) || other.selectedIcon == selectedIcon)&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,label,icon,selectedIcon,route);

@override
String toString() {
  return 'HomeShellNavigationDestination.item(label: $label, icon: $icon, selectedIcon: $selectedIcon, route: $route)';
}


}

/// @nodoc
abstract mixin class $HomeShellNavigationDestinationItemCopyWith<$Res> implements $HomeShellNavigationDestinationCopyWith<$Res> {
  factory $HomeShellNavigationDestinationItemCopyWith(HomeShellNavigationDestinationItem value, $Res Function(HomeShellNavigationDestinationItem) _then) = _$HomeShellNavigationDestinationItemCopyWithImpl;
@useResult
$Res call({
 String label, IconData icon, IconData selectedIcon, GoRouteData route
});




}
/// @nodoc
class _$HomeShellNavigationDestinationItemCopyWithImpl<$Res>
    implements $HomeShellNavigationDestinationItemCopyWith<$Res> {
  _$HomeShellNavigationDestinationItemCopyWithImpl(this._self, this._then);

  final HomeShellNavigationDestinationItem _self;
  final $Res Function(HomeShellNavigationDestinationItem) _then;

/// Create a copy of HomeShellNavigationDestination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,Object? icon = null,Object? selectedIcon = null,Object? route = null,}) {
  return _then(HomeShellNavigationDestinationItem(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,null == selectedIcon ? _self.selectedIcon : selectedIcon // ignore: cast_nullable_to_non_nullable
as IconData,null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as GoRouteData,
  ));
}


}

/// @nodoc


class HomeShellNavigationDestinationDivider implements HomeShellNavigationDestination {
  const HomeShellNavigationDestinationDivider();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeShellNavigationDestinationDivider);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeShellNavigationDestination.divider()';
}


}




// dart format on
