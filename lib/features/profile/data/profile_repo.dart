import 'package:dartz/dartz.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';

import '../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserModel>> getUserData({required String uid});
}
