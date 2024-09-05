import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.text,
    required this.enabled,
    this.controller,
  });

  final String text;
  final bool enabled;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              enabled: enabled,
              controller: controller,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
