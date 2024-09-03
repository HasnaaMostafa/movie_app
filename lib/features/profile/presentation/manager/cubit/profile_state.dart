part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetDataProfileLoading extends ProfileState {}

class GetDataProfileSuccess extends ProfileState {
  final UserModel userModel;

  GetDataProfileSuccess({required this.userModel});
}

class GetDataProfileError extends ProfileState {
  final String error;

  GetDataProfileError({required this.error});
}
