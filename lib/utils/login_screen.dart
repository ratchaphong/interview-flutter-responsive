// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_responsive/utils/button_global.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/utils/social_login.dart';
import 'package:flutter_responsive/utils/text_form_global.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).orientation == Orientation.landscape
                  ? screenSize.width * 0.7
                  : screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Logo",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Login to your account.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormGlobal(
                    controller: emailController,
                    obscureText: false,
                    text: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormGlobal(
                    controller: passwordController,
                    obscureText: true,
                    text: 'Password',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const ButtonGlobal(),
                  const SizedBox(
                    height: 32,
                  ),
                  const SocialLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 48,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            InkWell(
              onTap: () {},
              child: const Text(
                ' Sign up',
                style: TextStyle(
                  color: MyTheme.splash,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
