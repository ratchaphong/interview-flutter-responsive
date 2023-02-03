import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialLoginButtons extends StatelessWidget {
  final Function() onFbClick;
  final Function() onGoogleClick;
  const SocialLoginButtons(
      {super.key, required this.onFbClick, required this.onGoogleClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: MyTheme.redLight,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: MyTheme.redBorder,
                width: 0.2,
              ),
            ),
            child: InkWell(
              onTap: onGoogleClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/google.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Google",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: MyTheme.blueLight,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: MyTheme.blueBorder,
                width: 0.2,
              ),
            ),
            child: InkWell(
              onTap: onFbClick,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/facebook.svg"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Facebook",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
