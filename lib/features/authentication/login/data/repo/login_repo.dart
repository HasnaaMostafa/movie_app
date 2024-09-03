import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password});

  Future<Either<Failure, User>> signInWithGoogle();
}
