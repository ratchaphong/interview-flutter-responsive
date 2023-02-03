import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const InputForm({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.sono(
        textStyle: const TextStyle(),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.sono(
          textStyle: const TextStyle(
            color: Colors.black45,
          ),
        ),
        fillColor: MyTheme.greyColor,
        filled: true,
      ),
    );
  }
}
