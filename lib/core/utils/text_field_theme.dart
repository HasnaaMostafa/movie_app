import 'package:flutter/material.dart';

import 'package:movie_app/core/constant/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: const OutlineInputBorder().copyWith(
      
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),
 
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: const OutlineInputBorder().copyWith(
      
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),

  );
}
