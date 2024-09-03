part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({required this.user});
}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}

class LoginGoogleLoading extends LoginState {}

class LoginGoogleSuccess extends LoginState {
  final UserModel userModel;

  LoginGoogleSuccess({required this.userModel});
}

class LoginGoogleError extends LoginState {
  final String error;

  LoginGoogleError({required this.error});
}
