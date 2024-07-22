import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/theme.dart';
import 'package:movie_app/features/home%20screen/view/home_screen.dart';
import 'package:movie_app/nav_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        home:  NavMenuScreen(),
      ),
    );
  }
}
