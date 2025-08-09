// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class OtpVerificationScreen extends StatefulWidget {
//   final String phoneNumber;

//   const OtpVerificationScreen({Key? key, required this.phoneNumber})
//       : super(key: key);

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   String sessionId = ''; // Will be used with 2Factor API
//   String enteredOtp = '';

//   @override
//   void initState() {
//     super.initState();
//     sendOtp(); // Auto send OTP on screen load
//   }

//   Future<void> sendOtp() async {
//     // TODO: Replace with your 2Factor API Key and template ID
//     const apiKey = "YOUR_API_KEY";
//     final phone = widget.phoneNumber;

//     final url =
//         'https://2factor.in/API/V1/$apiKey/SMS/$phone/AUTOGEN'; // AUTOGEN uses your approved template

//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final responseBody = response.body;
//       print("OTP Sent: $responseBody");

//       final sid = RegExp(r'"Details":"(.+?)"').firstMatch(responseBody)?.group(1);
//       if (sid != null) {
//         setState(() => sessionId = sid);
//         Fluttertoast.showToast(msg: "OTP sent to $phone");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Failed to send OTP");
//     }
//   }

//   Future<void> verifyOtp() async {
//     if (enteredOtp.length != 6 || sessionId.isEmpty) {
//       Fluttertoast.showToast(msg: "Enter complete OTP");
//       return;
//     }

//     final verifyUrl =
//         'https://2factor.in/API/V1/YOUR_API_KEY/SMS/VERIFY/$sessionId/$enteredOtp';

//     final response = await http.get(Uri.parse(verifyUrl));

//     if (response.statusCode == 200) {
//       final body = response.body;
//       print("OTP Verify: $body");

//       if (body.contains('"Status":"Success"')) {
//         Fluttertoast.showToast(msg: "OTP Verified ✅");
//         // TODO: Navigate to home/dashboard
//       } else {
//         Fluttertoast.showToast(msg: "OTP Verification Failed ❌");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Error verifying OTP");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("OTP Verification"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             Text(
//               "Enter the OTP sent to ${widget.phoneNumber}",
//               style: const TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//             OtpTextField(
//               numberOfFields: 6,
//               borderColor: const Color(0xFF512DA8),
//               showFieldAsBox: true,
//               onCodeChanged: (String code) {},
//               onSubmit: (String otp) {
//                 setState(() => enteredOtp = otp);
//               },
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: verifyOtp,
//               child: const Text("Verify OTP"),
//             ),
//             const SizedBox(height: 16),
//             TextButton(
//               onPressed: sendOtp,
//               child: const Text("Resend OTP"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const CustomOtpScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<CustomOtpScreen> createState() => _CustomOtpScreenState();
}

class _CustomOtpScreenState extends State<CustomOtpScreen> {
  String otpCode = "";

  void _verifyOtp() {
    if (otpCode.length == 4) {
      print("Verifying OTP: $otpCode");
      // Add your verification logic here
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a 4-digit OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF26A4B), // gradient start color
                  ),
                ),

                SizedBox(height: 20),

                // Logo (Use your own asset or placeholder for now)
                Image.asset(
                  "assets/images/kindifyLogo.jpg",
                  width: 100,
                  height: 100,
                ),

                SizedBox(height: 20),

                // Subtitle
                Text(
                  "Enter the OTP sent to",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  widget.phoneNumber,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 24),

                // OTP Text Field
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: Colors.grey,
                  focusedBorderColor: Color(0xFFF26A4B),
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(12),
                  fieldWidth: 55,
                  onCodeChanged: (String code) {},
                  onSubmit: (String code) {
                    setState(() {
                      otpCode = code;
                    });
                  },
                ),

                SizedBox(height: 30),

                // Gradient Verify Button
                GestureDetector(
                  onTap: _verifyOtp,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF26A4B), Color(0xFFFFB74D)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Resend Link
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Implement resend logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("OTP Resent")),
                      );
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Colors.black87,
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

