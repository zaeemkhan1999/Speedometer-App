import 'package:flutter/material.dart';
import 'package:com.zaeem.authapp.authapp/configs/screen_size_config.dart';

class TextFields {
  static Widget textField(
      {required TextEditingController controller,
      required String hint,
      bool? obsecure}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ScreenConfig.theme.primaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        // style: const TextStyle(color: ),
        obscureText: obsecure ?? false,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}
