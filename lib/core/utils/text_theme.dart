import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom Class for Light & Dark Text Themes
class TTextTheme {
  TTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 13.0.sp,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      
        fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: Colors.amber),
    titleSmall: const TextStyle().copyWith(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 13.0.sp,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 13.0.sp,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11.0.sp,
      fontWeight: FontWeight.normal,
    ),
  );
}
