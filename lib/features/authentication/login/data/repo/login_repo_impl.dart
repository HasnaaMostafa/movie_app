import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/errors/servier_failure.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/authentication/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  static FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
          uId: response.user?.uid.toString(),
          email: email,
          name: response.user?.displayName);

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
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      await signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .get();
      if (!userDoc.exists) {
        UserModel model = UserModel(
            name: userCredential.user?.displayName,
            phone: userCredential.user?.phoneNumber,
            email: userCredential.user?.email,
            uId: userCredential.user?.uid,
            bio: "",
            isEmailVerified: false,
            image: userCredential.user?.photoURL,
            cover: "",
            isAgree: true);
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user?.uid)
            .set(model.toMap())
            .then((value) {
          print("Account created");
        }).catchError((error) {
          print(error.toString());
        });
        return right(model);
      } else {
        print("User already exists");
        return right(
            UserModel.fromJson(userDoc.data() as Map<String, dynamic>));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}
