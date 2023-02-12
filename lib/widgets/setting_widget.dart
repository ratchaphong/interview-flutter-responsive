import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive/blocs/auth/auth_bloc.dart';
import 'package:flutter_responsive/widgets/menu_list_tile.dart';

class SettingWidget extends StatefulWidget {
  final bool isResume;

  const SettingWidget({super.key, required this.isResume});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isResume
          ? null
          : Column(
              children: [
                MenuListTile(
                  title: 'Setting',
                  icon: Icons.settings_outlined,
                  endIcon: false,
                  onPress: () {},
                ),
                MenuListTile(
                  title: 'Information',
                  icon: Icons.info_outline,
                  endIcon: false,
                  onPress: () {},
                ),
                MenuListTile(
                  title: 'Logout',
                  icon: Icons.logout_outlined,
                  endIcon: true,
                  onPress: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      LogoutEvent(),
                    );
                    Navigator.of(context).pushNamed("/");
                  },
                ),
              ],
            ),
    );
  }
}
