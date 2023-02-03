import 'package:flutter/material.dart';
import 'package:flutter_responsive/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final bool endIcon;
  final IconData icon;
  final void Function()? onPress;

  const MenuListTile({
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
