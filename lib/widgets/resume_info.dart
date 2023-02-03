import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumeInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const ResumeInfo({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.sono(
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 16.0,
          ),
          child: Text(
            subtitle,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(),
            ),
          ),
        ),
      ],
    );
  }
}
