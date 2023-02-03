import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Certificate",
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
          ),
          child: Text(
            "Amet id minim ullamco pariatur et minim anim nisi dolore.",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Text(
            "Ipsum minim cillum dolore anim reprehenderit elit voluptate proident velit tempor aliqua velit pariatur.",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Text(
            "Nulla veniam incididunt nostrud et laboris.",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 16.0,
          ),
          child: Text(
            "Ad enim consectetur laboris adipisicing Lorem sit Lorem occaecat non non duis consequat.",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(),
            ),
          ),
        )
      ],
    );
  }
}
