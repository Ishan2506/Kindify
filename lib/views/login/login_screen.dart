import 'package:flutter/material.dart';
import 'package:kindify_app/controller/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        minimum: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF26B6C),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Select your role to continue",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              ToggleButtons(
                borderRadius: BorderRadius.circular(12),
                fillColor: const Color(0xFFFCB248),
                selectedColor: Colors.white,
                color: Colors.black,
                isSelected: _controller.roleSelection,
                onPressed: (index) {
                  setState(() {
                    _controller.toggleRole(index);
                  });
                },
                children: const [
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shield),
                          SizedBox(width: 8),
                          Text("Trust"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 8),
                          Text("User"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "+91",
                    style: TextStyle(fontSize: 16, color: Color(0xFFB569AB)),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _controller.emailController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter Mobile Number",
                        labelStyle: const TextStyle(color: Color(0xFFB569AB)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => _controller.login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF26B6C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "By continuing, you agree to Terms of Service",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}