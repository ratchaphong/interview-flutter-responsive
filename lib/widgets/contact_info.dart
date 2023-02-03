import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfo extends StatelessWidget {
  final String title;
  final IconData icon;

  const ContactInfo({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 32,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
