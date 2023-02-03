import 'package:flutter/material.dart';
import 'package:flutter_responsive/screens/login_screen.dart';
import 'package:flutter_responsive/screens/profile_screen.dart';
import 'package:flutter_responsive/screens/signup_screen.dart';
import 'package:flutter_responsive/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.dancingScript(
            textStyle: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          headline2: GoogleFonts.sono(
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
