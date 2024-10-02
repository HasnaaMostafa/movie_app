import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/show_toast.dart';
import 'package:movie_app/features/authentication/login/presentation/views/login_view.dart';
import 'package:movie_app/features/authentication/manager/password_cubit.dart';
import 'package:movie_app/features/authentication/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/nav_menu.dart';

import '../../../../login/presentation/manager/login_cubit/login_cubit.dart';
import '../../../../login/presentation/views/widgets/custom_button.dart';
import '../../../../login/presentation/views/widgets/custom_text_field.dart';
import '../../../../login/presentation/views/widgets/google_auth.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie",
                style: TextStyle( fontSize: 25),
              ),
              Text("zone",
                  style: TextStyle(color: Color(0xffea0101), fontSize: 25)),
            ],
          ),
        ),
        actions: const [Text("")],
      ),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, googleState) {
            if (googleState is LoginGoogleSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NavMenuScreen()));
            }
            if (googleState is LoginGoogleError) {
              print(googleState.error);
              showToast(
                  message: googleState.error.toString(),
                  state: ToastStates.error);
            }
          },
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showToast(
                    message: "Successfully Created",
                    state: ToastStates.success);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginView()),
                  (route) => false,
                );
                emailController.clear();
                passwordController.clear();
                nameController.clear();
                phoneController.clear();
              }
              if (state is RegisterError) {
                print(state.error);
                if (state.error
                    .contains("The email address is badly formatted.")) {
                  showToast(message: "Invalid Email", state: ToastStates.error);
                } else {
                  showToast(
                      message: state.error.toString(),
                      state: ToastStates.error);
                }
              }
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle( fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Let's get you started and create account",
                        style: TextStyle( fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      controller: nameController,
                      hintText: "Name",
                      hintStyle: const TextStyle(color: Color(0xff7f7f80)),
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Color(0xff7f7f80)),
                    ),
                    CustomTextField(
                      controller: phoneController,
                      hintText: "Phone Number",
                      hintStyle: const TextStyle(color: Color(0xff7f7f80)),
                    ),
                    BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, state) {
                        return CustomTextField(
                          isPassword: state,
                          controller: passwordController,
                          hintText: "Password",
                          suffix: GestureDetector(
                              onTap: () {
                                context
                                    .read<PasswordVisibilityCubit>()
                                    .toggleVisibility();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Icon(
                                  BlocProvider.of<PasswordVisibilityCubit>(
                                          context)
                                      .suffix,
                                  size: 15,
                                ),
                              )),
                          hintStyle: const TextStyle(color: Color(0xff7f7f80)),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          fillColor: WidgetStateProperty.all(Colors.black),
                          value: isChecked,
                          checkColor: const Color(0xffb60808),
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Yes,I understand and agree to Moviezone Terms of service , including the ",
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: " User Agreement and Privacy Policy",
                                  style: TextStyle(color: Color(0xffb60808)),
                                ),
                                TextSpan(
                                  text: ".",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      height: 60,
                      width: double.infinity,
                      text: "Sign up",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isChecked == true) {
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    isAgree: isChecked);
                          } else {
                            showToast(
                                message:
                                    "Please Agree Terms of Service to Continue",
                                state: ToastStates.error);
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: Text("OR",
                            style: TextStyle(
                              
                              fontSize: 15,
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    GoogleAuth(
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).loginGoogle();
                      },
                      text: "Sign Up With Google",
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginView()));
                          },
                          child: const Text(
                            " Sign in",
                            style: TextStyle(
                                color: Color(0xffc10606), fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
