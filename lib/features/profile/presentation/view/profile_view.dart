import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/view/widgets/profile_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../watch list/view/cubit/save_model/save_and_fetch_movie_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? uid;

  @override
  void initState() {
    uid = CacheHelper.getData(key: "uid");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getData(uid: uid ?? "");
    context.read<SaveAndFetchMovieCubit>().fetchMovies(uid: uid ?? "");

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, Object? state) {
        if (state is GetDataProfileSuccess) {
          UserModel userModel = state.userModel;
          return ProfileBody(userModel: userModel);
        } else if (state is GetDataProfileLoading) {
          return const Skeletonizer(enabled: true, child: ProfileBody());
        } else if (state is GetDataProfileError) {
          return Scaffold(body: Center(child: Text(state.error.toString())));
        } else {
          return Container();
        }
      },
    );
  }
}
