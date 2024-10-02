import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/core/utils/show_toast.dart';
import 'package:movie_app/features/authentication/register/presentation/views/register_view.dart';
import 'package:movie_app/nav_menu.dart';

import '../../../../manager/password_cubit.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'google_auth.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0, left: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie",
                style: TextStyle(fontSize: 25),
              ),
              Text("zone",
                  style: TextStyle(color: Color(0xffea0101), fontSize: 25)),
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              showToast(
                  message: "Successfully Login", state: ToastStates.success);

              CacheHelper.saveData(
                  key: "uid", value: state.user.uId.toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NavMenuScreen()));
            }
            if (state is LoginGoogleSuccess) {
              showToast(
                  message: "Successfully Login", state: ToastStates.success);
              CacheHelper.saveData(key: "uid", value: state.userModel.uId);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const NavMenuScreen()),
                (route) => false,
              );
              emailController.clear();
              passwordController.clear();
            }
            if (state is LoginError) {
              if (state.error.contains(
                  "The supplied auth credential is incorrect, malformed or has expired")) {
                showToast(
                    message: "Email or Password is not correct",
                    state: ToastStates.error);
              } else {
                showToast(
                    message: state.error.toString(), state: ToastStates.error);
              }
            }
            if (state is LoginGoogleError) {
              if (state.error.contains(
                  "The supplied auth credential is incorrect, malformed or has expired")) {
                showToast(
                    message: "Email or Password is not correct",
                    state: ToastStates.error);
              } else {
                showToast(
                    message: state.error.toString(), state: ToastStates.error);
                print(state.error.toString());
              }
            }
          },
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "please sign in to your account to continue",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      controller: emailController,
                      hintText: "Email / Phone Number",
                      hintStyle:
                          const TextStyle( fontSize: 16)),
                  BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, state) {
                      return CustomTextField(
                        controller: passwordController,
                        isPassword: state,
                        suffix: GestureDetector(
                            onTap: () {
                              context
                                  .read<PasswordVisibilityCubit>()
                                  .toggleVisibility();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(
                                BlocProvider.of<PasswordVisibilityCubit>(
                                        context)
                                    .suffix,
                                size: 15,
                              ),
                            )),
                        hintText: "Password",
                        hintStyle:
                            const TextStyle( fontSize: 16),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    height: 60,
                    width: double.infinity,
                    text: "Log in",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                      child: Text("OR",
                          style: TextStyle(
                           
                            fontSize: 15,
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  GoogleAuth(
                    onPressed: () {
                      BlocProvider.of<LoginCubit>(context).loginGoogle();
                    },
                    text: "Log in With Google",
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not registered yet?",
                        style: TextStyle(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RegisterView()));
                        },
                        child: const Text(
                          " Sign Up",
                          style:
                              TextStyle(color: Color(0xffc10606), fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
