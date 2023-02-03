import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final Orientation _orientation = MediaQuery.of(context).orientation;

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: _orientation == Orientation.portrait
          ? SafeArea(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: _size.height,
                width: _size.width,
                child: SignUpForm(
                    size: _size,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    cnfPassController: cnfPassController),
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Center(
                  child: Container(
                    width: _size.width * 0.7,
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: SignUpForm(
                        size: _size,
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        cnfPassController: cnfPassController),
                  ),
                ),
              ),
            ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required Size size,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.cnfPassController,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cnfPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/splash_icon.svg"),
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create your account",
                style: GoogleFonts.sono(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: MyTheme.splash,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Name",
                    hintStyle: GoogleFonts.sono(
                      textStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    fillColor: MyTheme.greyColor,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Email Address",
                    hintStyle: GoogleFonts.sono(
                      textStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    fillColor: MyTheme.greyColor,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextFormField(
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.sono(
                      textStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    fillColor: MyTheme.greyColor,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 16,
                ),
                child: TextFormField(
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
                  controller: cnfPassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Confirm Password",
                    hintStyle: GoogleFonts.sono(
                      textStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    fillColor: MyTheme.greyColor,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // if (InputValidator.validateField("Name", nameController.text.trim()) &&
                  //     InputValidator.validateField("Email", emailController.text.trim())) {
                  //   if (InputValidator.validatePassword(passwordController.text, cnfPassController.text)) {
                  //     AuthController.instance
                  //         .registerUser(emailController.text.trim(), passwordController.text.trim());
                  //   }
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.splash,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "SIGNUP",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Or",
                        style: GoogleFonts.sono(
                          textStyle: const TextStyle(
                            color: Color(0xFFC1C1C1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  // bottom: 16
                ),
                child:
                    SocialLoginButtons(onFbClick: () {}, onGoogleClick: () {}),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account ? ",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextSpan(
                text: "Login",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pop();
                    // Get.back();
                  },
              ),
              TextSpan(
                text: " here.",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
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