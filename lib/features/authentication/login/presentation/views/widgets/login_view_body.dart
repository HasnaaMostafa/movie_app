import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/register/presentation/views/register_view.dart';
import 'package:movie_app/features/home%20screen/view/home_screen.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Movie",
                style: TextStyle(color: Colors.white),
              ),
              Text("zone", style: TextStyle(color: Color(0xffea0101))),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff1d1d1d),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                textAlign: TextAlign.center,
                "please sign in to your account to continue",
                style: TextStyle(color: Color(0xffc4c4c4), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextField(
              hintText: "Email / Phone Number",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const CustomTextField(
              hintText: "Password",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              height: 45,
              width: 150,
              text: "Sign in",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()));
              },
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not registered yet?",
                  style: TextStyle(color: Color(0xffd4d4d4), fontSize: 15),
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
                    style: TextStyle(color: Color(0xffc10606), fontSize: 15),
                  ),
                )
              ],
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
