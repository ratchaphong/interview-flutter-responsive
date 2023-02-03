import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: const Text(
            "-Or sign in with-",
            style: TextStyle(
              color: MyTheme.splash,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: MediaQuery.of(context).size.width * .6,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    width: 32,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/twitter.svg',
                    width: 32,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
