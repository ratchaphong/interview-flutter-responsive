import 'package:flutter/material.dart';
import 'package:flutter_responsive/screens/login_screen.dart';
import 'package:flutter_responsive/screens/profile_screen.dart';
import 'package:flutter_responsive/screens/signup_screen.dart';
import 'package:flutter_responsive/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
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
