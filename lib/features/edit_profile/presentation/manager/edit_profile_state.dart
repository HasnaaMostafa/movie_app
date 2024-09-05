part of 'edit_profile_cubit.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class ProfileImagePickedSuccessState extends EditProfileState {}

class ProfileImagePickedErrorState extends EditProfileState {}

class UserUpdateLoadingState extends EditProfileState {}

class UserUpdateErrorState extends EditProfileState {}

class UserUpdateSuccessState extends EditProfileState {}
