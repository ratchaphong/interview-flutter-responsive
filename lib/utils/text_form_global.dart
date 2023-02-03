import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscureText;

  const TextFormGlobal(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(
        top: 4,
        left: 16,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
            ),
          ]),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          // hintStyle: TextStyle(
          //   height: 1,
          // ),
        ),
      ),
    );
  }
}
