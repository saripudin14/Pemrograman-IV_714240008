
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xFF3F5728);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Profile Card',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Oasis',

        scaffoldBackgroundColor: const Color(0xFFF4F7F0),

        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          titleTextStyle: TextStyle(
            fontFamily: 'Oasis',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}
