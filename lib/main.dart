import 'package:flutter/material.dart';
import 'package:kindify_app/services/token_storage.dart';
import 'package:kindify_app/views/splash_screen/splashScreen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

  // ✅ Save your token here
  
  await TokenStorageService.saveToken(
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4OWY2YjgxYjMzOTM1YWNmYWY5NmVhMSIsImVtYWlsIjoiZGV2c2hhaDEyMDkwMkBnbWFpbC5jb20iLCJyb2xlIjoiVXNlciIsImlhdCI6MTc1NjU3MzU1MywiZXhwIjoxNzU3MTc4MzUzfQ.vXzxz0k-KAotT7s-30xINyXh913zTWGlumULlhuli44",
  );
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
