import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindify_app/controller/registration/registrationController.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:kindify_app/views/login/login_screen.dart';
import 'package:path/path.dart' as path;

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
            height: MediaQuery.sizeOf(context).height * 0.93,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: registrationController.pickedFile == null
                      ? InkWell(
                          onTap: () async {
                            final error = await registrationController
                                .pickFile();
                            if (error != null) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(error)));
                            } else {
                              setState(() {}); // Refresh UI if image selected
                            }
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect, // Rounded rectangle
                            radius: const Radius.circular(8),
                            dashPattern: const [8, 4], // 8px dash, 4px gap
                            color: Colors.blueGrey,
                            strokeWidth: 2,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.78,
                              height: MediaQuery.sizeOf(context).height * 0.065,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    "Upload File",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Supported file types : .jpg, .png, .jpeg",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.065,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.elliptical(8, 8),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // Shadow color
                                spreadRadius: 1, // How far shadow spreads
                                blurRadius: 1, // Softness of shadow
                                offset: const Offset(
                                  1,
                                  2,
                                ), // Position of shadow (x, y)
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                              colors: [
                                                AppColors.primaryPink,
                                                AppColors.orange,
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ).createShader(
                                              Rect.fromLTWH(
                                                0,
                                                0,
                                                bounds.width,
                                                bounds.height,
                                              ),
                                            ),
                                        child: const Icon(
                                          Icons.check_circle_rounded,
                                          size: 24,
                                          color: Colors
                                              .white, // Required for ShaderMask
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            LinearGradient(
                                              colors: [
                                                AppColors.primaryPink,
                                                AppColors.orange,
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ).createShader(
                                              Rect.fromLTWH(
                                                0,
                                                0,
                                                bounds.width,
                                                bounds.height,
                                              ),
                                            ),
                                        child: Text(
                                          "Uploaded Successfully!!",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors
                                                .white, // Required for ShaderMask
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    registrationController.pickedFile = null;
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.cancel),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      await registrationController.register(context);
                    },
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
            hintStyle: TextStyle(color: const Color.fromARGB(172, 36, 35, 35)),
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
