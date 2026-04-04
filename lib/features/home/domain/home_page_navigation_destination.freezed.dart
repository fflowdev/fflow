// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_navigation_destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageNavigationDestination {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageNavigationDestination);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageNavigationDestination()';
}


}

/// @nodoc
class $HomePageNavigationDestinationCopyWith<$Res>  {
$HomePageNavigationDestinationCopyWith(HomePageNavigationDestination _, $Res Function(HomePageNavigationDestination) __);
}


/// Adds pattern-matching-related methods to [HomePageNavigationDestination].
extension HomePageNavigationDestinationPatterns on HomePageNavigationDestination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomePageNavigationDestinationItem value)?  item,TResult Function( HomePageNavigationDestinationDivider value)?  divider,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomePageNavigationDestinationItem() when item != null:
return item(_that);case HomePageNavigationDestinationDivider() when divider != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomePageNavigationDestinationItem value)  item,required TResult Function( HomePageNavigationDestinationDivider value)  divider,}){
final _that = this;
switch (_that) {
case HomePageNavigationDestinationItem():
return item(_that);case HomePageNavigationDestinationDivider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomePageNavigationDestinationItem value)?  item,TResult? Function( HomePageNavigationDestinationDivider value)?  divider,}){
final _that = this;
switch (_that) {
case HomePageNavigationDestinationItem() when item != null:
return item(_that);case HomePageNavigationDestinationDivider() when divider != null:
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
case HomePageNavigationDestinationItem() when item != null:
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomePageNavigationDestinationDivider() when divider != null:
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
case HomePageNavigationDestinationItem():
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomePageNavigationDestinationDivider():
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
case HomePageNavigationDestinationItem() when item != null:
return item(_that.label,_that.icon,_that.selectedIcon,_that.route);case HomePageNavigationDestinationDivider() when divider != null:
return divider();case _:
  return null;

}
}

}

/// @nodoc


class HomePageNavigationDestinationItem implements HomePageNavigationDestination {
  const HomePageNavigationDestinationItem(this.label, this.icon, this.selectedIcon, this.route);
  

 final  String label;
 final  IconData icon;
 final  IconData selectedIcon;
 final  GoRouteData route;

/// Create a copy of HomePageNavigationDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageNavigationDestinationItemCopyWith<HomePageNavigationDestinationItem> get copyWith => _$HomePageNavigationDestinationItemCopyWithImpl<HomePageNavigationDestinationItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageNavigationDestinationItem&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.selectedIcon, selectedIcon) || other.selectedIcon == selectedIcon)&&(identical(other.route, route) || other.route == route));
}


@override
int get hashCode => Object.hash(runtimeType,label,icon,selectedIcon,route);

@override
String toString() {
  return 'HomePageNavigationDestination.item(label: $label, icon: $icon, selectedIcon: $selectedIcon, route: $route)';
}


}

/// @nodoc
abstract mixin class $HomePageNavigationDestinationItemCopyWith<$Res> implements $HomePageNavigationDestinationCopyWith<$Res> {
  factory $HomePageNavigationDestinationItemCopyWith(HomePageNavigationDestinationItem value, $Res Function(HomePageNavigationDestinationItem) _then) = _$HomePageNavigationDestinationItemCopyWithImpl;
@useResult
$Res call({
 String label, IconData icon, IconData selectedIcon, GoRouteData route
});




}
/// @nodoc
class _$HomePageNavigationDestinationItemCopyWithImpl<$Res>
    implements $HomePageNavigationDestinationItemCopyWith<$Res> {
  _$HomePageNavigationDestinationItemCopyWithImpl(this._self, this._then);

  final HomePageNavigationDestinationItem _self;
  final $Res Function(HomePageNavigationDestinationItem) _then;

/// Create a copy of HomePageNavigationDestination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,Object? icon = null,Object? selectedIcon = null,Object? route = null,}) {
  return _then(HomePageNavigationDestinationItem(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,null == selectedIcon ? _self.selectedIcon : selectedIcon // ignore: cast_nullable_to_non_nullable
as IconData,null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as GoRouteData,
  ));
}


}

/// @nodoc


class HomePageNavigationDestinationDivider implements HomePageNavigationDestination {
  const HomePageNavigationDestinationDivider();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageNavigationDestinationDivider);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomePageNavigationDestination.divider()';
}


}




// dart format on
