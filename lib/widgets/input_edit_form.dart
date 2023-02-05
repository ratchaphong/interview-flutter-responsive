import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';

class InputEditForm extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const InputEditForm({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: MyTheme.splash,
      style: GoogleFonts.sono(
        textStyle: const TextStyle(),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        label: Text(label),
        prefixIcon: Icon(icon),
        labelStyle: GoogleFonts.sono(
          textStyle: TextStyle(
            color: MyTheme.splash.withOpacity(0.7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1.0,
            color: MyTheme.splash,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2.0,
            color: MyTheme.splash,
          ),
        ),
      ),
    );
  }
}
