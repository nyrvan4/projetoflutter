import 'package:flutter/material.dart';

class Navigation {
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}