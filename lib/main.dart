import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/theme.dart';
import 'package:movie_app/features/authentication/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/authentication/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/intro/presentation/views/intro_view.dart';

import 'core/helper/bloc_observer.dart';
import 'core/helper/cache_helper.dart';
import 'core/helper/dio_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/authentication/login/data/repo/login_repo.dart';
import 'features/authentication/register/data/repo/register_repo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServiceLocator();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                LoginCubit(loginRepo: getIt.get<LoginRepo>())),
        BlocProvider(
            create: (BuildContext context) =>
                RegisterCubit(registerRepo: getIt.get<RegisterRepo>()))
      ],
      child: ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          home: const IntroView(),
        ),
      ),
    );
  }
}
