import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant/sizes.dart';


/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
//To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    ),
  );
}
