import 'package:flutter/material.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  List<bool> roleSelection = [true, false]; // Admin selected by default

  void togglePasswordVisibility() {
    showPassword = !showPassword;
  }

  void toggleRole(int index) {
    for (int i = 0; i < roleSelection.length; i++) {
      roleSelection[i] = i == index;
    }
  }

  void login(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String role = roleSelection[0] ? "Admin" : "User";

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // You can add real login logic here
    debugPrint("Login as $role: $email - $password");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Logged in as $role")),
    );
  }
}
