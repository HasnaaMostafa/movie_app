import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/authentication/login/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:movie_app/features/watch%20list/view/watch_list_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (BuildContext context, Object? state) {},
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

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Profile Data",
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.edit,
              size: 16,
              color: Color(0xffB7950B),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "${userModel?.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${userModel?.bio}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Saved Movies",
              style: TextStyle(fontSize: 15),
            ),
            const Expanded(flex: 3, child: Watchlist()),
          ],
        ),
      ),
    );
  }
}
