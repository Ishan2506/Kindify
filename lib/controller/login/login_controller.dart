import 'package:flutter/material.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<bool> roleSelection = [true, false]; // Trust selected by default

  void toggleRole(int index) {
    for (int i = 0; i < roleSelection.length; i++) {
      roleSelection[i] = i == index;
    }
  }

  void login(BuildContext context) {
    String email = emailController.text.trim();
    String role = roleSelection[0] ? "Trust" : "User";

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter mobile number")),
      );
      return;
    }

    // You can add real login logic here
    debugPrint("Login as $role: $email");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logged in as $role")),
    );
  }
}