import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/errors/servier_failure.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/authentication/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required bool isAgree,
  }) async {
    try {
      var response = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = userCreate(
          email: email,
          name: name,
          phone: phone,
          uId: response.user!.uid,
          isAgree: isAgree);

      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  UserModel userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required bool isAgree,
  }) {
    UserModel model = UserModel(
        name: name,
        phone: phone,
        email: email,
        uId: uId,
        bio: "write you bio...",
        isEmailVerified: false,
        image: "",
        cover: "",
        isAgree: isAgree);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      print("Account created");
    }).catchError((error) {
      print(error.toString());
    });
    return model;
  }
}
