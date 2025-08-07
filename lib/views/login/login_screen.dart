import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kindify_app/controller/login/login_controller.dart';
import 'package:kindify_app/utils/colors.dart';

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
      backgroundColor: const Color(0xFFFDF5F5),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  "assets/images/kindifyLogo.png",
                  width: 150,
                  height: 150,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: 140,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield),
                        SizedBox(width: 10),
                        Text("Trust"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: 140,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.elliptical(6, 6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text("User"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: 315,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: _controller.emailController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter mobile number",
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("+91", style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 8),
                            Container(height: 24, width: 1, color: Colors.grey),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Checkbox(value: true, onChanged: (value) {}),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              // Regular black text
                              const TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize:
                                      15, // Set your desired font size here
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              // Gradient for Terms & Conditions (same style, no underline)
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle Terms tap
                                    },
                                    child: ShaderMask(
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                            colors: [
                                              AppColors.orange,
                                              AppColors.primaryPink,
                                            ],
                                          ).createShader(
                                            Rect.fromLTWH(
                                              0,
                                              0,
                                              bounds.width,
                                              bounds.height,
                                            ),
                                          ),
                                      child: const Text(
                                        "Terms & Conditions ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Regular black text
                              const TextSpan(
                                text: "\nand ",
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),

                              // Gradient for Privacy Policy (same style, no underline)
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle Privacy Policy tap
                                    },
                                    child: ShaderMask(
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                            colors: [
                                              AppColors.orange,
                                              AppColors.primaryPink,
                                            ],
                                          ).createShader(
                                            Rect.fromLTWH(
                                              0,
                                              0,
                                              bounds.width,
                                              bounds.height,
                                            ),
                                          ),
                                      child: const Text(
                                        "Privacy Policy.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Checkbox(value: false, onChanged: (value) {}),
                        ),
                        Text(
                          "I consent to secure UPI donations \nand account verification process.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              loginBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget loginBtn() {
  return Container(
    width: 310,
    height: 55,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFF56A79), Color(0xFFFCB248)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
    ),
    child: Center(
      child: Text(
        "Continue",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
