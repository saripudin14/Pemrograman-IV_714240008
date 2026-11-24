import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remember Me',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const LoginScreen(),
    );
  }
}