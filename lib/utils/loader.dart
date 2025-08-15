import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.orange, AppColors.primaryPink],
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 120,
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.orange, AppColors.primaryPink],
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                "Sending OTP to your email..",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
