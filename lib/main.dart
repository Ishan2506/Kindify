import 'package:flutter/material.dart';
import 'package:kindify_app/views/screens/splashScreen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KindiFy"),
        backgroundColor: const Color.fromARGB(255, 229, 229, 84),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Jai Dwarkadish!!")],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SplashScreen();
              },
            ),
          );
        },
        backgroundColor: Colors.yellow,
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
