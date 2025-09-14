import 'package:flutter/material.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/views/splash_screen/splashScreen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

  // ✅ Save your token here
  
  
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindify App',
      home: SplashScreen(),
    );
  }
}
