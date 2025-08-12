import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindify_app/controller/registration/registrationController.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/login/login_screen.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationController registrationController =
      RegistrationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.asset(
                    "assets/images/kindifyLogo.png",
                    width: 150,
                    height: 50,
                  ),
                ),
                _textInputField(
                  context: context,
                  controller: registrationController.trustName,
                  preIcon: Icons.admin_panel_settings_sharp,
                  hintText: "Trust Name",
                  keyboardType: TextInputType.text,
                ),
                _textInputField(
                  context: context,
                  controller: registrationController.adminName,
                  preIcon: Icons.person,
                  hintText: "Admin Name",
                  keyboardType: TextInputType.text,
                ),
                _textInputField(
                  context: context,
                  controller: registrationController.mobileNum,
                  preIcon: Icons.phone,
                  hintText: "Phone",
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),
                _textInputField(
                  context: context,
                  controller: registrationController.email,
                  preIcon: Icons.email_rounded,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                _textInputField(
                  context: context,
                  controller: registrationController.darpanId,
                  preIcon: Icons.badge_rounded,
                  hintText: "Darpan Id",
                  keyboardType: TextInputType.text,
                ),
                //Make the file upload widget
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryPink, AppColors.orange],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          colors: [AppColors.primaryPink, AppColors.orange],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "Already Registered?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Required for ShaderMask
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _textInputField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
  required TextInputType? keyboardType,
  int? maxLength, // optional
  String? Function(String?)? validator, // optional
  List<TextInputFormatter>? inputFormatters, // optional
  IconData? preIcon, // optional
}) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * 0.8,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 1, // How far shadow spreads
              blurRadius: 1, // Softness of shadow
              offset: const Offset(1, 2), // Position of shadow (x, y)
            ),
          ],
        ),
        child: TextFormField(
          // changed to TextFormField to allow validator
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength, // will be null if not passed
          validator: validator, // will be null if not passed
          inputFormatters: inputFormatters, // will be null if not passed
          decoration: InputDecoration(
            counterText: "", // hides maxLength counter if used
            prefixIcon: Icon(preIcon),
            hintText: hintText,
            border: InputBorder.none, // Removes border
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ),
    ),
  );
}
