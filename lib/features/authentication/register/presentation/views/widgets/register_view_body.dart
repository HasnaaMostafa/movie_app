import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/login/presentation/views/login_view.dart';

import '../../../../../home screen/view/home_screen.dart';
import '../../../../login/presentation/views/widgets/custom_button.dart';
import '../../../../login/presentation/views/widgets/custom_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
        actions: const [Text("")],
      ),
      backgroundColor: const Color(0xff1d1d1d),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                textAlign: TextAlign.center,
                "Let's get you started and create account",
                style: TextStyle(color: Color(0xffc4c4c4), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextField(
              hintText: "Name",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const CustomTextField(
              hintText: "Email",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const CustomTextField(
              hintText: "Phone Number",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const CustomTextField(
              hintText: "Password",
              hintStyle: TextStyle(color: Color(0xff7f7f80)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  fillColor: WidgetStateProperty.all(Colors.white),
                  value: false,
                  onChanged: (value) {},
                ),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Yes,I understand and agree to Moviezone Terms of service , including the ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: " User Agreement and Privacy Policy",
                          style: TextStyle(color: Color(0xffb60808)),
                        ),
                        TextSpan(
                          text: ".",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              height: 45,
              width: 150,
              text: "Sign up",
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
                  "Already have an account?",
                  style: TextStyle(color: Color(0xffd4d4d4), fontSize: 15),
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
