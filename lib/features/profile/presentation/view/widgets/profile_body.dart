import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:movie_app/features/edit_profile/presentation/views/edit_profile_view.dart';

import '../../../../authentication/login/data/models/user_model.dart';
import '../../../../watch list/view/watch_list_screen.dart';

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
        leading: const SizedBox(),
        scrolledUnderElevation: 0,
        title: const Text(
          "Profile Data",
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const EditProfileScreen()));
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 22,
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.shade800,
                          backgroundImage: userModel?.image != null
                              ? NetworkImage(userModel!.image!)
                              : const AssetImage('assets/images/profile.jpg')
                                  as ImageProvider,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                  ],
                ),
              ),
            ),
            const Text(
              "Saved Movies",
              style: TextStyle(fontSize: 15),
            ),
            const Expanded(flex: 5, child: Watchlist()),
          ],
        ),
      ),
    );
  }
}
