import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kindify_app/controller/login/login_controller.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/login/otp_screen.dart';
import 'package:kindify_app/views/terms_conditions/terms_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();
  bool _upiConsent = false;
  bool _policy = false;
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //bool isLoading = false;
  Future<void> _sendOtp() async {
    //setState(() => isLoading = true); // Show loader

    await _controller.register(context); // API call

    //setState(() => isLoading = false); // Hide loader
  }

  Widget _buildSelectableCard(String title,IconData icon)
  {
    final isSelected = _controller.selectedRole == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.toggleRole(title);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 140,
        height: 70,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFEEAE6) : Colors.white,
          border: Border.all(
            color: isSelected ? Color(0xFFF26A4B) : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Color(0xFFF26A4B) : Colors.black),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xFFF26A4B) : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  _buildSelectableCard("Trust", Icons.shield),
                  _buildSelectableCard("User", Icons.person),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: 315,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    controller: _controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email Address",
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.email_outlined, color: Colors.grey),
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
                          child: Checkbox(
                            value: _policy,
                            onChanged: (value) {
                              setState(() {
                                _policy = value ?? false;
                              });
                            },
                          ),
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return TermsAndConditions();
                                          },
                                        ),
                                      );
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
                          child: Checkbox(
                            value: _upiConsent,
                            onChanged: (value) {
                              setState(() {
                                _upiConsent = value ?? false;
                              });
                            },
                          ),
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      String email = _controller.emailController.text.trim();
                      if (!_policy || !_upiConsent) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please agree to the Terms and give UPI consent.")),
                        );
                        return;
                      }
                      if (email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fill field!!")),
                        );
                        return;
                      }
                      if (_emailRegex.hasMatch(email)) {
                        _sendOtp();
                        
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a valid email address")),
                        );
                      }
                    },
                    child: loginBtn(),
                  ),
                  const SizedBox(height: 20,),
                  //Register as trust?
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xFFF56A79), Color(0xFFFCB248)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      ).createShader(Rect.fromLTWH(0, 0,bounds.width, bounds.height)),
                      child: Text(
                        "Register as Trust?",
                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Required for ShaderMask
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
