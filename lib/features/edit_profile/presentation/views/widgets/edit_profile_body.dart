import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/authentication/login/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:movie_app/features/authentication/login/presentation/views/login_view.dart';
import 'package:movie_app/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:movie_app/features/edit_profile/presentation/views/widgets/edit_text_field.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';

import '../../../../authentication/login/data/models/user_model.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    super.key,
    this.userModel,
    this.uid,
  });

  final UserModel? userModel;
  final String? uid;

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is UserUpdateSuccessState) {
          BlocProvider.of<ProfileCubit>(context).getData(uid: widget.uid ?? "");
          if (Navigator.of(context).canPop()) {
            Navigator.pop(context);
          }
          BlocProvider.of<EditProfileCubit>(context).profileImage = null;
        }
      },
      builder: (context, state) {
        var profileImage =
            BlocProvider.of<EditProfileCubit>(context).profileImage;
        nameController.text = widget.userModel?.name ?? "";
        phoneController.text = widget.userModel?.phone ?? "";
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const Text(
              "Edit Profile",
              style: TextStyle(fontSize: 15),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    if (profileImage != null) {
                      BlocProvider.of<EditProfileCubit>(context)
                          .uploadProfileImage(
                              name: nameController.text,
                              phone: phoneController.text,
                              bio: widget.userModel?.bio ?? "",
                              userModel: widget.userModel);
                    } else {
                      BlocProvider.of<EditProfileCubit>(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: widget.userModel?.bio ?? "",
                          userModel: widget.userModel);
                    }
                  },
                  child: const Icon(
                    Icons.check,
                    size: 25,
                    color: AppColors.primaryColor,
                  ),
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
                  flex: 3,
                  child: SingleChildScrollView(
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
                              backgroundImage: profileImage == null
                                  ? widget.userModel?.image == null
                                      ? const AssetImage(
                                          'assets/images/profile.jpg')
                                      : NetworkImage(
                                          widget.userModel?.image ?? "")
                                  : FileImage(profileImage) as ImageProvider,
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<EditProfileCubit>(context)
                                    .getProfileImage();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          controller: nameController,
                          text: "Name",
                          enabled: true,
                        ),
                        EditTextField(
                          controller: phoneController,
                          text: "Phone",
                          enabled: true,
                        ),
                        EditTextField(
                          text: "Email",
                          controller: TextEditingController(
                              text: widget.userModel?.email),
                          enabled: false,
                        ),
                        const SizedBox(
                          height: 180,
                        ),
                        BlocListener<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is LogoutSuccessfully) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginView()),
                                  ((Route<dynamic> route) => false));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: 350,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          AppColors.primaryColor)),
                                  onPressed: () async {
                                    await BlocProvider.of<LogoutCubit>(context)
                                        .logout();
                                  },
                                  child: const Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
