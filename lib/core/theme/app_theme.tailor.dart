// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeDataTailorMixin on ThemeExtension<AppThemeData> {
  Color get surface;

  @override
  AppThemeData copyWith({Color? surface}) {
    return AppThemeData(surface: surface ?? this.surface);
  }

  @override
  AppThemeData lerp(covariant ThemeExtension<AppThemeData>? other, double t) {
    if (other is! AppThemeData) return this as AppThemeData;
    return AppThemeData(surface: Color.lerp(surface, other.surface, t)!);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeData &&
            const DeepCollectionEquality().equals(surface, other.surface));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(surface),
    );
  }
}

extension AppThemeDataBuildContextProps on BuildContext {
  AppThemeData get appThemeData => Theme.of(this).extension<AppThemeData>()!;
  Color get surface => appThemeData.surface;
}
