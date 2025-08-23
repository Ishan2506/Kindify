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



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/loader.dart';
import 'package:kindify_app/services/toast_service.dart';
import 'package:kindify_app/views/Profile/ProfilePage.dart';
import 'package:kindify_app/views/home/home_screen.dart';
import 'package:kindify_app/views/home/home_screens.dart';

class CustomOtpScreen extends StatefulWidget {
  final String email;
  
  final String role;

  const CustomOtpScreen({Key? key, required this.email,required this.role})
      : super(key: key);

  @override
  State<CustomOtpScreen> createState() => _CustomOtpScreenState();
}

class _CustomOtpScreenState extends State<CustomOtpScreen> {
  String otpCode = "";
  int resendCount =0;
  bool canResend= true;
  bool isLoading = false;
  Future<void> _resendOtp (BuildContext content) async {
    if(!canResend) return;
    setState(() {
      isLoading = true;
    });
    try{
      var response = await http.post(Uri.parse("https://kindify-backend.onrender.com/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": widget.email,
          "role": widget.role
        }),
      );
      final jsonRes = jsonDecode(response.body) as Map<String,dynamic>;
      if(response.statusCode==200){
        ToastService.showSuccess(content,"OTP sent to your E-Mail Address");
        setState(() {
            resendCount++;
            if (resendCount >= 3) {
              canResend = false;
            }
        });

      }
      else{
        ToastService.showError(content,"${jsonRes['message'] as String}");
         
      }
    }catch(e){
      ToastService.showError(content,"Error ${e.toString()}");
    }
    finally{
      setState(() {
        isLoading = false;
      });
    }
  }


  Future<void> _verify() async {
    try{
      if(otpCode.length ==6){
          var response = await http.post(Uri.parse("https://kindify-backend.onrender.com/auth/verify-login"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "email": widget.email,
                "otp": otpCode
              }),
          );
          final jsonRes = jsonDecode(response.body) as Map<String,dynamic>;
          debugPrint("response:- ${response.body}_${response.statusCode}");
          if(response.statusCode == 200){
            String jwtToken = jsonRes['token'] as String;
            await TokenStorageService.saveToken(jwtToken);
            ToastService.showSuccess(context, "${jsonRes['message'] as String}");
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreens()),
              (Route<dynamic> route) => false,
            );
          }
          else if(response.statusCode == 404){
            ToastService.showError(context, "User not Found!");
          }
          else{
            ToastService.showError(context, "${jsonRes['message'] as String}");
          }
      }
      else if(otpCode.isEmpty){
        ToastService.showError(context, "Please enter the OTP!");
      }
      else{
        ToastService.showError(context, "Please enter a 6-digit OTP");
      }
      
    }catch(e){
      ToastService.showError(context, "Error ${e.toString()}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [Center(
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
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
          
                  SizedBox(height: 4),
          
                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
          
                  SizedBox(height: 24),
          
                  // OTP Text Field
                  OtpTextField(
                    numberOfFields: 6,
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
                    onTap: _verify,
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
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: canResend && !isLoading
                          ? () => _resendOtp(context)
                          : null,
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              decoration: canResend ? TextDecoration.underline : TextDecoration.none,
                              fontSize: 17,
                              color: Colors.black87.withValues(alpha: canResend ? 1.0 : 0.35),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if(isLoading)
            Positioned.fill(child: Container(
              child: 
              Center(
                child: LoaderScreen(txtDisplay: "Resending the OTP..."),
              ),
              color: Colors.black.withValues(alpha: 0.4)
            ))
          ],
        ),
      ),
    );
  }
}
