import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  TextEditingController emailController = TextEditingController();
  String selectedRole= "Trust";



  void toggleRole(String role) {
    selectedRole = role;
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<bool> register(BuildContext content) async {
    String email = emailController.text.trim();
    debugPrint("Email:-${email}_Role:- ${selectedRole}");
    if(email.isEmpty){
      _showSnack(content, "Please Enter the email!");
    }

    try{
      var response = await http.post(Uri.parse("https://kindify-backend.onrender.com/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "role": selectedRole,
      }),
      );

      if(response.statusCode==200){
        debugPrint("Regsiter");
        return true;
      }
      else{
        debugPrint("${response.statusCode}__${response.body}");
        return false;
      }
    }catch(e){
      _showSnack(content, "Error: $e");
      debugPrint("❌ Exception: $e");
      return false;
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