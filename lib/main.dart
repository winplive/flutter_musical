import 'package:flutter/material.dart';
import 'package:musical_app/screen/home_screen.dart';
import 'package:musical_app/screen/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
