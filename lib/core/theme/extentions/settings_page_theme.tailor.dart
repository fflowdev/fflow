// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_page_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SettingsPageThemeTailorMixin on ThemeExtension<SettingsPageTheme> {
  TextStyle get tileGroupTitleTextStyle;
  SettingsListTileTheme get tileTheme;

  @override
  SettingsPageTheme copyWith({
    TextStyle? tileGroupTitleTextStyle,
    SettingsListTileTheme? tileTheme,
  }) {
    return SettingsPageTheme(
      tileGroupTitleTextStyle:
          tileGroupTitleTextStyle ?? this.tileGroupTitleTextStyle,
      tileTheme: tileTheme ?? this.tileTheme,
    );
  }

  @override
  SettingsPageTheme lerp(
    covariant ThemeExtension<SettingsPageTheme>? other,
    double t,
  ) {
    if (other is! SettingsPageTheme) return this as SettingsPageTheme;
    return SettingsPageTheme(
      tileGroupTitleTextStyle: TextStyle.lerp(
        tileGroupTitleTextStyle,
        other.tileGroupTitleTextStyle,
        t,
      )!,
      tileTheme: tileTheme.lerp(other.tileTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsPageTheme &&
            const DeepCollectionEquality().equals(
              tileGroupTitleTextStyle,
              other.tileGroupTitleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(tileTheme, other.tileTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(tileGroupTitleTextStyle),
      const DeepCollectionEquality().hash(tileTheme),
    );
  }
}

extension SettingsPageThemeBuildContextProps on BuildContext {
  SettingsPageTheme get settingsPageTheme =>
      Theme.of(this).extension<SettingsPageTheme>()!;
  TextStyle get tileGroupTitleTextStyle =>
      settingsPageTheme.tileGroupTitleTextStyle;
  SettingsListTileTheme get tileTheme => settingsPageTheme.tileTheme;
}

mixin _$SettingsListTileThemeTailorMixin
    on ThemeExtension<SettingsListTileTheme> {
  Radius get borderRadius;
  Color get backgroundColor;
  Color get iconBackgroundColor;
  Color get iconColor;
  Color get dividerColor;
  TextStyle get titleTextStyle;
  TextStyle get subtitleTextStyle;

  @override
  SettingsListTileTheme copyWith({
    Radius? borderRadius,
    Color? backgroundColor,
    Color? iconBackgroundColor,
    Color? iconColor,
    Color? dividerColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  }) {
    return SettingsListTileTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconColor: iconColor ?? this.iconColor,
      dividerColor: dividerColor ?? this.dividerColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
    );
  }

  @override
  SettingsListTileTheme lerp(
    covariant ThemeExtension<SettingsListTileTheme>? other,
    double t,
  ) {
    if (other is! SettingsListTileTheme) return this as SettingsListTileTheme;
    return SettingsListTileTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      iconBackgroundColor: Color.lerp(
        iconBackgroundColor,
        other.iconBackgroundColor,
        t,
      )!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      subtitleTextStyle: TextStyle.lerp(
        subtitleTextStyle,
        other.subtitleTextStyle,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsListTileTheme &&
            const DeepCollectionEquality().equals(
              borderRadius,
              other.borderRadius,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              iconBackgroundColor,
              other.iconBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(
              dividerColor,
              other.dividerColor,
            ) &&
            const DeepCollectionEquality().equals(
              titleTextStyle,
              other.titleTextStyle,
            ) &&
            const DeepCollectionEquality().equals(
              subtitleTextStyle,
              other.subtitleTextStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(iconBackgroundColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(dividerColor),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(subtitleTextStyle),
    );
  }
}
