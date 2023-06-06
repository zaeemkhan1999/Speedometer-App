import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class Buttons {
  static Widget neopopButton(
      {required void Function()? onTap, required String title}) {
    return NeoPopTiltedButton(
      isFloating: true,
      color: Colors.blueGrey,
      floatingDelay: const Duration(microseconds: 10),
      floatingDuration: const Duration(seconds: 1),
      onTapUp: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 15,
        ),
        child: Text(title),
      ),
    );
  }
}
