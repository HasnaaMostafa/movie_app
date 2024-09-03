import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  void getData({required String uid}) async {
    emit(GetDataProfileLoading());

    var response = await profileRepo.getUserData(uid: uid);

    response.fold((error) {
      emit(GetDataProfileError(error: error.errMessage.toString()));
    }, (userModel) {
      emit(GetDataProfileSuccess(userModel: userModel));
    });
  }
}
