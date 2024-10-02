import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/login/presentation/views/login_view.dart';
import 'package:movie_app/features/authentication/login/presentation/views/widgets/custom_button.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Movie",
                  style: TextStyle(
                      
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text("zone",
                    style: TextStyle(
                        color: Color(0xffea0101),
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Your number one destination",
              style: TextStyle( fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              width: 300,
              height: 60,
              text: "Watch Movies",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginView()));
              },
            )
          ],
        ),
      ),
    );
  }
}
