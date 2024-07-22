import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      side: const BorderSide(),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: 20),
      textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      side: const BorderSide(),
      textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
