import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(true);

  void toggleVisibility() {
    emit(!state);
  }

  IconData get suffix =>
      state ? Icons.visibility_off_outlined : Icons.visibility_outlined;
}
