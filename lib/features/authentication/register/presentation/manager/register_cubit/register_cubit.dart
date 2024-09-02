import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../login/data/models/user_model.dart';
import '../../../data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  final RegisterRepo registerRepo;

  void registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required bool isAgree,
  }) async {
    emit(RegisterLoading());
    var response = await registerRepo.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
        isAgree: isAgree);

    response.fold((failure) {
      emit(RegisterError(error: failure.errMessage));
    }, (user) {
      emit(RegisterSuccess(userModel: user));
    });
  }
}
