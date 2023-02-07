// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive/model/auth.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/widgets/avatar.dart';
import 'package:flutter_responsive/widgets/input_edit_form.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  double vertical = 32;
  double horizotal = 16;
  double imageSize = 120;
  double iconSize = 48;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final descriptionController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EditProfileArgs;
    final auth = args.auth;

    if (kDebugMode) {
      print('edit profile edit_profile_args');
      print(auth.name);
      print(auth.email);
    }

    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is AuthFinish) {}
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading || state is AuthInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthFinish) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: MyTheme.splash,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                title: Center(
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.sono(fontWeight: FontWeight.bold),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Container(
                      width: orientation == Orientation.landscape
                          ? size.width * 0.7
                          : size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: vertical,
                        horizontal: horizotal,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.16,
                            constraints: const BoxConstraints(
                              minHeight: 140,
                            ),
                            child: Avatar(
                              orientation: orientation,
                              size: size,
                              imageSize: imageSize,
                              horizotal: horizotal,
                              icon: Icons.camera_alt_outlined,
                              iconSize: iconSize,
                              onTap: () {},
                            ),
                          ),
                          LayoutBuilder(
                            builder: (BuildContext, BoxConstraints) =>
                                // ignore: sized_box_for_whitespace
                                Container(
                              width: BoxConstraints.maxWidth * 0.8,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: InputEditForm(
                                      label: 'Full Name',
                                      icon: Icons.person_outline_rounded,
                                      controller: fullNameController,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: InputEditForm(
                                      label: 'Email',
                                      icon: Icons.email_outlined,
                                      controller: emailController,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: InputEditForm(
                                      label: 'Phone Number',
                                      icon: Icons.phone_android_outlined,
                                      controller: phoneNumberController,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 32),
                                    child: Description(
                                      descriptionController:
                                          descriptionController,
                                      minLines: 3,
                                      maxLines: null,
                                      maxLength: null,
                                    ),
                                  ),
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    width: size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (kDebugMode) {
                                          print(fullNameController.text.trim());
                                          print(emailController.text.trim());
                                          print(phoneNumberController.text
                                              .trim());
                                          print(descriptionController.text
                                              .trim());
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyTheme.splash,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(36),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        child: Text(
                                          'SUBMIT',
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  const Description({
    Key? key,
    required this.descriptionController,
    required this.minLines,
    required this.maxLines,
    required this.maxLength,
  }) : super(key: key);

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionController,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: TextInputType.multiline,
      cursorColor: MyTheme.splash,
      style: GoogleFonts.sono(
        textStyle: const TextStyle(),
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
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
        labelText: 'Description',
        labelStyle: GoogleFonts.sono(
          textStyle: TextStyle(
            color: MyTheme.splash.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}

class EditProfileArgs {
  final Data auth;
  EditProfileArgs(this.auth);
}
