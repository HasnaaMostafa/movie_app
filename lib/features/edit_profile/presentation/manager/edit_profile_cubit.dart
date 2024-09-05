import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/core/utils/constants.dart';

import '../../../authentication/login/data/models/user_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print("No image selected");
      emit(ProfileImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
    UserModel? userModel,
  }) {
    emit(UserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(profileImage!.path).pathSegments.last}")
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(
            name: name,
            phone: phone,
            bio: bio,
            image: value,
            userModel: userModel);
        emit(UserUpdateSuccessState());
      }).catchError((error) {
        emit(ProfileImagePickedErrorState());
      });
    }).catchError((error) {
      emit(ProfileImagePickedErrorState());
    });
  }

  void updateUser({
    String? name,
    String? phone,
    String? bio,
    String? cover,
    String? image,
    UserModel? userModel,
  }) {
    emit(UserUpdateLoadingState());
    UserModel model = UserModel(
        name: name,
        phone: phone,
        bio: bio,
        image: image ?? userModel?.image,
        email: userModel?.email,
        uId: userModel?.uId);
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel?.uId ?? uId)
        .update(model.toMap())
        .then((value) {
      emit(UserUpdateSuccessState());
    }).catchError((error) {
      emit(UserUpdateErrorState());
      print(error.toString());
    });
  }
}
