import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/servier_failure.dart';
import 'package:movie_app/features/profile/data/profile_repo.dart';

import '../../../core/errors/failure.dart';
import '../../authentication/login/data/models/user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  UserModel? userModel;
  @override
  Future<Either<Failure, UserModel>> getUserData({required String uid}) async {
    try {
      var userDoc =
          await fireStore.collection("users").doc(uid).get().then((value) {
        userModel = UserModel.fromJson(value.data()!);
      });
      return right(userModel!);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
