import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:movie_app/features/edit_profile/presentation/views/widgets/edit_profile_body.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? uid;

  @override
  void initState() {
    uid = CacheHelper.getData(key: "uid");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getData(uid: uid ?? "");

    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        if (state is UserUpdateLoadingState) {
          return Skeletonizer(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (BuildContext context, Object? state) {
                if (state is GetDataProfileSuccess) {
                  UserModel userModel = state.userModel;
                  return EditProfileBody(userModel: userModel, uid: uid);
                } else if (state is GetDataProfileLoading) {
                  return const Skeletonizer(
                      enabled: true, child: EditProfileBody());
                } else if (state is GetDataProfileError) {
                  return Scaffold(
                      body: Center(child: Text(state.error.toString())));
                } else {
                  return Container();
                }
              },
            ),
          );
        } else {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (BuildContext context, Object? state) {
              if (state is GetDataProfileSuccess) {
                UserModel userModel = state.userModel;
                return EditProfileBody(userModel: userModel, uid: uid);
              } else if (state is GetDataProfileLoading) {
                return const Skeletonizer(
                    enabled: true, child: EditProfileBody());
              } else if (state is GetDataProfileError) {
                return Scaffold(
                    body: Center(child: Text(state.error.toString())));
              } else {
                return Container();
              }
            },
          );
        }
      },
    );
  }
}
