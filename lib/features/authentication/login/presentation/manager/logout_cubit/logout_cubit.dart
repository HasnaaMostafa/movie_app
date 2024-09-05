import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/features/authentication/login/data/repo/login_repo_impl.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    try {
      await LoginRepoImpl.auth.signOut();
      await CacheHelper.removeData(key: "uid");
      log("User logged out successfully");
      emit(LogoutSuccessfully());
    } catch (e) {
      log("Logout error: $e");
    }
  }
}
