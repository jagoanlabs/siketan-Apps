import 'package:flutter/material.dart';
import 'color.dart';

class AppTextStyles {
  static const _fontFamily = 'Onest';

  /// Base generator function
  static TextStyle _base({
    required Color color,
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color,
      fontWeight: weight ?? FontWeight.normal,
      fontSize: size,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // === Primary ===
  static TextStyle primary({
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        color: AppColors.gray900,
        weight: weight,
        size: size,
        height: height,
        letterSpacing: letterSpacing,
      );

  // === Secondary ===
  static TextStyle secondary({
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        color: AppColors.gray600,
        weight: weight,
        size: size,
        height: height,
        letterSpacing: letterSpacing,
      );

  // === Third ===
  static TextStyle third({
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        color: AppColors.gray500,
        weight: weight,
        size: size,
        height: height,
        letterSpacing: letterSpacing,
      );

  // === Urgent ===
  static TextStyle urgent({
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        color: AppColors.gray400,
        weight: weight,
        size: size,
        height: height,
        letterSpacing: letterSpacing,
      );

  // === Disabled ===
  static TextStyle disabled({
    FontWeight? weight,
    double? size,
    double? height,
    double? letterSpacing,
  }) =>
      _base(
        color: AppColors.gray400,
        weight: weight,
        size: size,
        height: height,
        letterSpacing: letterSpacing,
      );
}
