
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/utils/loader.dart';
import 'package:kindify_app/services/toast_service.dart';
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
  int countdown = 0;
  Timer? _timer;

    void startTimer() {
    setState(() {
      countdown = 60;
      canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        setState(() {
          if (resendCount < 3) {
            canResend = true; 
          }
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }
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
            if (resendCount < 3) {
            startTimer();
            } else {
              canResend = false;
            }
        });

      }
      else{
        ToastService.showError(content,jsonRes['message'] as String);
         
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
            
            ToastService.showSuccess(context, jsonRes['message'] as String);
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
            ToastService.showError(context, jsonRes['message'] as String);
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                    fieldWidth: MediaQuery.of(context).size.width / 8,
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
                          onTap: canResend && !isLoading ? () => _resendOtp(context) : null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Resend",
                                style: TextStyle(
                                  decoration: canResend ? TextDecoration.underline : TextDecoration.none,
                                  fontSize: 17,
                                  color: Colors.black87.withValues(alpha: canResend ? 1.0 : 0.35),
                                ),
                              ),
                              if (!canResend && countdown > 0) ...[
                                const SizedBox(width: 6),
                                Text(
                                  "(${countdown}s)",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          if(isLoading)
            Positioned.fill(child: Container(
              color: Colors.black.withValues(alpha: 0.4),
              child: 
              Center(
                child: LoaderScreen(txtDisplay: "Resending the OTP..."),
              )
            ))
          ],
        ),
      ),
    );
  }
}
