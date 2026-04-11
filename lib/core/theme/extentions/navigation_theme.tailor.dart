// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$NavigationThemeTailorMixin on ThemeExtension<NavigationTheme> {
  Color get backgroundColor;
  Color get selectedItemColor;
  Color get selectedItemIconColor;
  TextStyle get selectedItemLabelStyle;
  Color get unselectedItemColor;
  Color get unselectedItemIconColor;
  TextStyle get unselectedItemLabelStyle;

  @override
  NavigationTheme copyWith({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? selectedItemIconColor,
    TextStyle? selectedItemLabelStyle,
    Color? unselectedItemColor,
    Color? unselectedItemIconColor,
    TextStyle? unselectedItemLabelStyle,
  }) {
    return NavigationTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      selectedItemIconColor:
          selectedItemIconColor ?? this.selectedItemIconColor,
      selectedItemLabelStyle:
          selectedItemLabelStyle ?? this.selectedItemLabelStyle,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
      unselectedItemIconColor:
          unselectedItemIconColor ?? this.unselectedItemIconColor,
      unselectedItemLabelStyle:
          unselectedItemLabelStyle ?? this.unselectedItemLabelStyle,
    );
  }

  @override
  NavigationTheme lerp(
    covariant ThemeExtension<NavigationTheme>? other,
    double t,
  ) {
    if (other is! NavigationTheme) return this as NavigationTheme;
    return NavigationTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      selectedItemColor: Color.lerp(
        selectedItemColor,
        other.selectedItemColor,
        t,
      )!,
      selectedItemIconColor: Color.lerp(
        selectedItemIconColor,
        other.selectedItemIconColor,
        t,
      )!,
      selectedItemLabelStyle: TextStyle.lerp(
        selectedItemLabelStyle,
        other.selectedItemLabelStyle,
        t,
      )!,
      unselectedItemColor: Color.lerp(
        unselectedItemColor,
        other.unselectedItemColor,
        t,
      )!,
      unselectedItemIconColor: Color.lerp(
        unselectedItemIconColor,
        other.unselectedItemIconColor,
        t,
      )!,
      unselectedItemLabelStyle: TextStyle.lerp(
        unselectedItemLabelStyle,
        other.unselectedItemLabelStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedItemColor,
              other.selectedItemColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedItemIconColor,
              other.selectedItemIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              selectedItemLabelStyle,
              other.selectedItemLabelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              unselectedItemColor,
              other.unselectedItemColor,
            ) &&
            const DeepCollectionEquality().equals(
              unselectedItemIconColor,
              other.unselectedItemIconColor,
            ) &&
            const DeepCollectionEquality().equals(
              unselectedItemLabelStyle,
              other.unselectedItemLabelStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(selectedItemColor),
      const DeepCollectionEquality().hash(selectedItemIconColor),
      const DeepCollectionEquality().hash(selectedItemLabelStyle),
      const DeepCollectionEquality().hash(unselectedItemColor),
      const DeepCollectionEquality().hash(unselectedItemIconColor),
      const DeepCollectionEquality().hash(unselectedItemLabelStyle),
    );
  }
}

extension NavigationThemeBuildContextProps on BuildContext {
  NavigationTheme get navigationTheme =>
      Theme.of(this).extension<NavigationTheme>()!;
  Color get backgroundColor => navigationTheme.backgroundColor;
  Color get selectedItemColor => navigationTheme.selectedItemColor;
  Color get selectedItemIconColor => navigationTheme.selectedItemIconColor;
  TextStyle get selectedItemLabelStyle =>
      navigationTheme.selectedItemLabelStyle;
  Color get unselectedItemColor => navigationTheme.unselectedItemColor;
  Color get unselectedItemIconColor => navigationTheme.unselectedItemIconColor;
  TextStyle get unselectedItemLabelStyle =>
      navigationTheme.unselectedItemLabelStyle;
}
