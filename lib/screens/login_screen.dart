import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();

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
              child: Container(
                color: Colors.transparent,
                height: _size.height,
                width: _size.width,
                child: LoginForm(
                  size: _size,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.transparent,
                    width: _size.width * 0.7,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: LoginForm(
                      size: _size,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required Size size,
    required this.emailController,
    required this.passwordController,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: SvgPicture.asset(
            "assets/images/splash_icon.svg",
            // height: 72,
            // fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/profile");
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
          ),
          child: Text(
            "Welcome Buddies,",
            style: GoogleFonts.sono(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          "Login to book your seat, I said its your seat",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: _size.width,
          child: Column(
            children: [
              Text(
                "Login to your account",
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
                  controller: emailController,
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Username",
                    // hintStyle: const TextStyle(
                    //   color: Colors.black45,
                    // ),
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
                  controller: passwordController,
                  obscureText: true,
                  style: GoogleFonts.sono(
                    textStyle: const TextStyle(),
                  ),
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
                child: Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // Get.defaultDialog(
                      //   title: "Forgort Password?",
                      //   content: TextFormField(
                      //     style: const TextStyle(color: Colors.black),
                      //     controller: forgotEmailController,
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5),
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       hintText: "Email address",
                      //       hintStyle:
                      //           const TextStyle(color: Colors.black45),
                      //       fillColor: MyTheme.greyColor,
                      //       filled: true,
                      //     ),
                      //   ),
                      //   radius: 10,
                      //   onWillPop: () {
                      //     forgotEmailController.text = "";

                      //     return Future.value(true);
                      //   },
                      //   contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 20, vertical: 10),
                      //   confirm: ElevatedButton(
                      //     onPressed: () {
                      //       AuthController.instance.forgorPassword(
                      //           forgotEmailController.text.trim());
                      //       forgotEmailController.text = "";
                      //       Get.back();
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: MyTheme.splash,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4),
                      //       ),
                      //     ),
                      //     child: const Center(
                      //       child: Padding(
                      //         padding: EdgeInsets.all(12),
                      //         child: Text(
                      //           "Send Reset Mail",
                      //           style: TextStyle(fontSize: 16),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.sono(
                        textStyle: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // AuthController.instance.login(
                  //     emailController.text.trim(),
                  //     passwordController.text.trim());
                  if (kDebugMode) {
                    print(emailController.text.trim());
                    print(passwordController.text.trim());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.splash,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "LOGIN",
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
                ),
                child: SocialLoginButtons(
                  onFbClick: () {},
                  onGoogleClick: () {
                    // AuthController.instance.googleLogin();
                  },
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don’t have an account ? ",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextSpan(
                text: "Sign up",
                // style: const TextStyle(
                //   decoration: TextDecoration.underline,
                //   fontWeight: FontWeight.w700,
                // ),
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                    Navigator.pushNamed(context, "/signup");
                    // Get.to(const SignUpScreen());
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