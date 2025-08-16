import 'package:flutter/material.dart';
import 'package:kindify_app/utils/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderScreen extends StatefulWidget {
  String txtDisplay;
  LoaderScreen({super.key,required this.txtDisplay});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
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
                widget.txtDisplay,
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
