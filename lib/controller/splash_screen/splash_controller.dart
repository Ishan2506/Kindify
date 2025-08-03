import 'package:flutter/material.dart';
import '../../views/login/login_screen.dart';

class SplashController {
  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
