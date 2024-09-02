import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/authentication/login/data/repo/login_repo.dart';

import '../../../data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  void loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    var response = await loginRepo.login(email: email, password: password);

    response.fold((failure) {
      emit(LoginError(error: failure.errMessage));
    }, (user) {
      emit(LoginSuccess(user: user));
    });
  }

  void loginGoogle() async {
    emit(LoginGoogleLoading());
    var response = await loginRepo.signInWithGoogle();

    response.fold((failure) {
      emit(LoginGoogleError(error: failure.errMessage));
    }, (user) {
      emit(LoginGoogleSuccess(user: user));
    });
  }
}
