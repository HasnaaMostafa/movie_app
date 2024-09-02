part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel userModel;

  RegisterSuccess({required this.userModel});
}

class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}
