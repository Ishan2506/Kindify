import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kindify_app/views/login/otp_screen.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  String selectedRole = "Trust";

  void toggleRole(String role) {
    selectedRole = role;
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> register(BuildContext content) async {
    String email = emailController.text.trim();
    debugPrint("Email:-${email}_Role:- $selectedRole");
    if (email.isEmpty) {
      _showSnack(content, "Please Enter the email!");
    }

    try{
      var response = await http.post(Uri.parse("https://kindify-backend.onrender.com/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
      }),
      );

      if(response.statusCode==200){
        ScaffoldMessenger.of(content).showSnackBar(
          const SnackBar(content: Text("OTP sent to your E-Mail Address")),
        );
        Navigator.push(content,MaterialPageRoute(
            builder: (context) => CustomOtpScreen(email: email),
          ),
        );

      }
      else if(response.statusCode == 404){
        ScaffoldMessenger.of(content).showSnackBar(
          const SnackBar(content: Text("User not Found!")),
        );
      }
      else{
        ScaffoldMessenger.of(content).showSnackBar(
          const SnackBar(content: Text("Failed to send otp!")),
        );
      }
    }catch(e){
      ScaffoldMessenger.of(content).showSnackBar(
        SnackBar(content: Text("Error ${e.toString()}")),
      );
    }
  }

  // void login(BuildContext context) {
  //   String email = emailController.text.trim();
  //   String role = roleSelection[0] ? "Trust" : "User";

  //   if (email.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Please enter mobile number")),
  //     );
  //     return;
  //   }

  //   // You can add real login logic here
  //   debugPrint("Login as $role: $email");

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("Logged in as $role")),
  //   );
  // }
}
