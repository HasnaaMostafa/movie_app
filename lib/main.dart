import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/theme.dart';
import 'package:movie_app/features/authentication/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/authentication/manager/password_cubit.dart';
import 'package:movie_app/features/authentication/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/intro/presentation/views/intro_view.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/profile/data/profile_repo.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:movie_app/nav_menu.dart';

import 'core/helper/bloc_observer.dart';
import 'core/helper/cache_helper.dart';
import 'core/helper/dio_helper.dart';
import 'core/utils/constants.dart';
import 'core/utils/service_locator.dart';
import 'features/authentication/login/data/repo/login_repo.dart';
import 'features/authentication/register/data/repo/register_repo.dart';
import 'features/watch list/view/cubit/save_model/save_and_fetch_movie_cubit.dart';
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

  Widget widget;

  uId = CacheHelper.getData(key: "uid");

  if (uId != null) {
    widget = const NavMenuScreen();
  } else {
    widget = const IntroView();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.startWidget});

  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                LoginCubit(loginRepo: getIt.get<LoginRepo>())),
        BlocProvider(
            create: (BuildContext context) =>
                RegisterCubit(registerRepo: getIt.get<RegisterRepo>())),
        BlocProvider(
            create: (BuildContext context) =>
                ProfileCubit(profileRepo: getIt.get<ProfileRepo>())
                  ..getData(uid: CacheHelper.getData(key: "uid") ?? "")),
        BlocProvider(
            create: (BuildContext context) =>
                SaveAndFetchMovieCubit(FirebaseFirestore.instance)
                  ..fetchMovies(uid: uId ?? "")),
        BlocProvider(create: (BuildContext context) => MovieInfoCubit()),
        BlocProvider(
            create: (BuildContext context) => PasswordVisibilityCubit()),
      ],
      child: ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          home: startWidget,
        ),
      ),
    );
  }
}
