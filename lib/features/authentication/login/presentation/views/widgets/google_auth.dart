import 'package:flutter/material.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/google.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
