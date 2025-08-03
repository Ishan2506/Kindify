import 'package:flutter/material.dart';
import '../../controller/splash_screen/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;

  late Animation<double> _scaleAnimation;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _fadeTextAnimation;

  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.4).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.center,
      end: const Alignment(-0.4, 0.0), // Move slightly left after scaling
    ).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInOut),
    );

    _fadeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    // Start animations with delays
    Future.delayed(const Duration(seconds: 2), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 4000), () {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _logoController,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
                alignment: _alignmentAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/kindifyLogo.jpg",
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      FadeTransition(
                        opacity: _fadeTextAnimation,
                        child: Text(
                          "Kindify",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color(0xFFF26B6C), // Pink
                                  Color(0xFFB569AB), // Purple
                                  Color(0xFFFCB248), // Orange
                                ],
                              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

