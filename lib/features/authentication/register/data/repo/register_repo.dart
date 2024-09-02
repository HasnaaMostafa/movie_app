import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required bool isAgree,
  });
  UserModel userCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required bool isAgree,
  });
}
