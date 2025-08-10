import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        shadows: [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            color: Colors.black,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                    ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [AppColors.orange, AppColors.primaryPink],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Scrollable content with fixed height
            SizedBox(
              height:
                  MediaQuery.sizeOf(context).height *
                  0.71, // fixed height for scroll
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Text(
                  "Welcome to Kindify App. By accessing or using our services, "
                  "you agree to be bound by these Terms and Conditions. Kindify App is designed "
                  "to facilitate food distribution initiatives and allow individuals to donate "
                  "through the platform. Users may view their donation history, contribution "
                  "impact, and related information via their profiles.\n\n"
                  "By using Kindify App, you confirm that your donations are made voluntarily and "
                  "that you are legally permitted to do so. The platform serves solely as an "
                  "intermediary, connecting donors with verified distribution initiatives. "
                  "Kindify App does not guarantee specific outcomes or distribution timelines, "
                  "and while we aim to ensure transparency, we are not liable for events beyond "
                  "our reasonable control.\n\n"
                  "You are responsible for maintaining the confidentiality of your account details. "
                  "Misuse of the platform, including fraudulent donations or misrepresentation, "
                  "will result in suspension or termination of your account. By continuing to use "
                  "the service, you acknowledge and accept that Kindify App may update these "
                  "Terms and Conditions periodically, and your continued use signifies acceptance "
                  "of any changes.\n\n"
                  "If you do not agree with any part of these Terms and Conditions, please "
                  "discontinue use of Kindify App immediately.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.84,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF56A79), Color(0xFFFCB248)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                ),
                child: const Center(
                  child: Text(
                    "Proceed",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
