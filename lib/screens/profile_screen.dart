import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isResume = true;
  bool isShowArticle = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Orientation orientation = MediaQuery.of(context).orientation;

    Size size = MediaQuery.of(context).size;
    double vertical = 32;
    double horizotal = 16;
    double imageSize = 120;
    double cameraIconSize = 48;

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.splash));

    return Scaffold(
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
                        cameraIconSize: cameraIconSize),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Muhhammad Jarmann",
                      style: GoogleFonts.dancingScript(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      // style: TextStyle(
                      //   fontSize: 24,
                      //   color: Colors.black,
                      //   fontWeight: FontWeight.bold,
                      // ),dancingScriptTextTheme
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      "Software Engineer",
                      // style: TextStyle(
                      //   fontSize: 16,
                      //   color: Colors.black.withOpacity(0.7),
                      // ),
                      style: GoogleFonts.sono(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    width: size.width * 0.6,
                    child: isResume
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "mmjarmann@gmail.com",
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.phone_android_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "087 415 4xxx",
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 16,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.map_outlined,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Vallalla Pakistan",
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyTheme.splash,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Text(
                                            'Resume',
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
                                            isShowArticle = !isShowArticle;
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
                                                BorderRadius.circular(16),
                                            side: const BorderSide(
                                              color: MyTheme.splash,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          child: Text(
                                            'Setting',
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
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
                              padding: const EdgeInsets.symmetric(vertical: 12),
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
                  Container(
                    child: isResume
                        ? null
                        : Column(
                            children: [
                              MenuWidgets(
                                title: 'Setting',
                                icon: Icons.settings_outlined,
                                endIcon: false,
                                onPress: () {},
                              ),
                              MenuWidgets(
                                title: 'Information',
                                icon: Icons.info_outline,
                                endIcon: false,
                                onPress: () {},
                              ),
                              MenuWidgets(
                                title: 'Logout',
                                icon: Icons.logout_outlined,
                                endIcon: true,
                                onPress: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                  ),
                  Container(
                      child: isShowArticle
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About",
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
                                    "Lorem ea eu commodo ut anim ipsum aute excepteur nisi. Pariatur sint dolor minim irure laboris cupidatat laboris labore. Anim veniam excepteur esse ut ad nisi aliquip.Pariatur nostrud culpa nostrud laborum est id eu. Non deserunt deserunt Lorem ipsum ipsum consectetur in. Occaecat dolore enim enim nostrud veniam. Occaecat esse enim Lorem fugiat.",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Portfolio",
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
                                    "Voluptate exercitation laborum culpa non labore ullamco exercitation eu sunt velit reprehenderit adipisicing in labore. Exercitation duis Lorem ut nisi aliqua non nostrud dolor et reprehenderit sunt proident proident ut. Proident deserunt aliqua irure eu reprehenderit magna consequat. Duis velit consequat ex adipisicing exercitation officia dolore in anim Lorem ullamco sunt minim. Eu enim est dolor nisi magna excepteur cupidatat dolore pariatur irure tempor minim. In excepteur deserunt nostrud elit minim proident voluptate elit elit minim.Ullamco incididunt eiusmod veniam irure quis. Labore est esse ipsum esse sint elit labore non non est do voluptate. Eiusmod qui irure sint tempor cupidatat commodo laborum cupidatat. Sit incididunt dolor excepteur adipisicing voluptate non tempor reprehenderit dolore proident. Cupidatat adipisicing dolore eu reprehenderit voluptate excepteur velit labore qui proident reprehenderit cillum aute ullamco. In deserunt velit est cillum veniam duis irure id incididunt nostrud et. Anim consequat amet cillum nulla ut.Anim excepteur adipisicing Lorem velit est et deserunt deserunt aliqua. Lorem consectetur nulla voluptate exercitation. Esse sunt officia ex cupidatat sint. Non aliquip nostrud cillum adipisicing occaecat sint ullamco sint irure ex.",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final Orientation orientation;
  final Size size;
  final double imageSize;
  final double horizotal;
  final double cameraIconSize;

  const Avatar({
    Key? key,
    required this.orientation,
    required this.size,
    required this.imageSize,
    required this.horizotal,
    required this.cameraIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5 - (imageSize / 2) - horizotal
              : size.width * 0.5 - (imageSize / 2) - horizotal,
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              border: Border.all(color: MyTheme.splash, width: 4),
              borderRadius: BorderRadius.circular(120 / 2),
            ),
          ),
        ),
        Positioned(
          top: 4,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5 - (imageSize / 2) - horizotal + 4
              : size.width * 0.5 - (imageSize / 2) - horizotal + 4,
          child: Container(
            width: imageSize - (4 * 2),
            height: imageSize - (4 * 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular((imageSize - (4 * 2)) / 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular((imageSize - (4 * 2)) / 2),
              child: const Image(
                image: AssetImage('assets/images/rratcha.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: imageSize - (4 * 2) - (cameraIconSize / 2) - 4,
          left: orientation == Orientation.landscape
              ? (size.width * 0.7) * 0.5
              : size.width * 0.5,
          child: Container(
            height: cameraIconSize,
            width: cameraIconSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cameraIconSize / 2),
              color: MyTheme.appBarColor,
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class MenuWidgets extends StatelessWidget {
  final String title;
  final bool endIcon;
  final IconData icon;
  final void Function()? onPress;

  const MenuWidgets({
    Key? key,
    required this.title,
    required this.endIcon,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        title,
        style: GoogleFonts.sono(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: MyTheme.splash.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: MyTheme.splash,
        ),
      ),
      trailing: endIcon
          ? null
          : Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey,
              ),
            ),
    );
  }
}
