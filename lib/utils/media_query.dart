import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        color: CustomColors.android,
        child: Center(
          child: Text(
            'View\n\n'
            '[MediaQuery width]: ${screenSize.width.toStringAsFixed(2)}\n\n'
            '[MediaQuery orientation]: $orientation',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class CustomColors {
  static const Color android = Color(0xFF092f42);
  static const Color greenAccent = Color(0xFF4cf186);
}
