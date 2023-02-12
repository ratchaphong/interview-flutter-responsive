import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:flutter_responsive/screens/edit_contact_screen.dart';
import 'package:flutter_responsive/widgets/article_widget.dart';
import 'package:flutter_responsive/widgets/avatar.dart';
import 'package:flutter_responsive/widgets/contact_info.dart';
import 'package:flutter_responsive/widgets/setting_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isResume = true;
  bool isShowArticle = false;
  double vertical = 32;
  double horizotal = 16;
  double imageSize = 120;
  double iconSize = 48;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.splash));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.splash,
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(
              LogoutEvent(),
            );
            // Navigator.of(context).pop();
            Navigator.of(context).pushNamed("/");
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Center(
          child: Text(
            'Profile',
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthError) {
            if (kDebugMode) {
              print(state.message);
            }
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading || state is AuthInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthFinish) {
              return SingleChildScrollView(
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
                              icon: Icons.edit_outlined,
                              iconSize: iconSize,
                              onTap: () {
                                // Navigator.pushNamed(
                                //   context,
                                //   "/profile/edit",
                                //   arguments: EditProfileScreen(
                                //     name: state.contact.name,
                                //     email: state.contact.email,
                                //     phoneNumber: state.contact.phoneNumber,
                                //     address: state.contact.address,
                                //   ),
                                // );
                                Navigator.pushNamed(
                                  context,
                                  "/contact/edit",
                                  arguments: EditContactScreen(
                                    id: state.auth.id ?? 0,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            // child: Text(
                            //   state.auth.name ?? " ",
                            //   style: Theme.of(context).textTheme.headline1,
                            // ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        capitalize(state.auth.name ?? "nomad"),
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  TextSpan(
                                    text: " ",
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  TextSpan(
                                    text: capitalize(
                                        state.auth.surname ?? "christ"),
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 16.0,
                            ),
                            child: Text(
                              state.auth.occupation ?? "Guest",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            width: size.width * 0.6,
                            child: isResume
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: ContactInfo(
                                          title: state.auth.email ??
                                              "guest@gmail.com",
                                          icon: Icons.email_outlined,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: ContactInfo(
                                          title: formatPhoneNumber(
                                              state.auth.phoneNumber ??
                                                  "xxxxxxxxxx"),
                                          icon: Icons.phone_android_outlined,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 16,
                                        ),
                                        child: ContactInfo(
                                          title: state.auth.address ??
                                              "Moscow Russia",
                                          icon: Icons.map_outlined,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      MyTheme.splash,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 12),
                                                  child: Text(
                                                    'Resume',
                                                    style: GoogleFonts.roboto(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isShowArticle =
                                                        !isShowArticle;
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    side: const BorderSide(
                                                      color: MyTheme.splash,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 12,
                                                  ),
                                                  child: Text(
                                                    'Setting',
                                                    style: GoogleFonts.roboto(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: MyTheme.splash,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isResume = false;
                                                    isShowArticle = false;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyTheme.splash,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Text(
                                        "Say Hi",
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isResume = !isResume;
                                      });
                                    },
                                  ),
                          ),
                          const Divider(),
                          SettingWidget(isResume: isResume),
                          ArticleWidget(isShowArticle: isShowArticle)
                        ],
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
      ),
    );
  }
}

String capitalize(String e) {
  return e[0].toUpperCase() + e.substring(1);
}

String formatPhoneNumber(String e) {
  return "${e.substring(0, 3)} ${e.substring(3, 6)} ${e.substring(6)}";
}
