import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    this.suffix,
    this.isPassword,
    this.suffixPressed,
    this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
    this.style,
    this.onChanged,
    this.onSaved,
    this.isDateORTime,
  });

  final String? hintText;
  final TextStyle? hintStyle;
  final String? suffix;
  final bool? isPassword;
  final void Function()? suffixPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? style;
  final bool? isDateORTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextFormField(
              onSaved: onSaved,
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
              onChanged: onChanged,
              onFieldSubmitted: onFieldSubmitted,
              obscureText: isPassword ?? false,
              style: const TextStyle(color: Color(0xff767678)),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 19, top: 18, bottom: 18),
                hintText: hintText,
                hintStyle: hintStyle,
                fillColor: const Color(0xff232325),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xff1d1d1d))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xff1d1d1d))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xff1d1d1d))),
                isDense: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
