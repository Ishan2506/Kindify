import 'package:flutter/material.dart';
import '../../controller/splash_screen/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _textController;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeTextAnimation;

  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _fadeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    // Start animations
    Future.delayed(const Duration(milliseconds: 500), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      _textController.forward();
    });

    Future.delayed(const Duration(seconds: 6), () {
      _controller.navigateToLogin(context);
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: Listenable.merge([_logoController, _textController]),
        builder: (context, child) {
          return Center(
            child: Transform.scale(
              scale: _scaleAnimation.value,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/kindifyLogo.jpg",
                    width: screenSize.width * 0.35,
                    height: screenSize.height * 0.18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10), // Tight controlled spacing
                  FadeTransition(
                    opacity: _fadeTextAnimation,
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFFF26B6C),
                          Color(0xFFB569AB),
                          Color(0xFFFCB248),
                        ],
                      ).createShader(bounds),
                      child: const Text(
                        "Kindify",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Required for shader
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
