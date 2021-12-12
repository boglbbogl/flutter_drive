import 'package:flutter/material.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';

AppBar mainAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    title: Text('Drive'),
    actions: [
      _actionIcons(onTap: () {}, icon: Icons.add_box_outlined),
      _actionIcons(onTap: () {}, icon: Icons.settings),
      _actionIcons(
          onTap: () {
            context
                .read<AuthProvider>()
                .signOut(provider: context.read<AuthProvider>().user!.provider);
          },
          icon: Icons.account_box_rounded),
    ],
  );
}

IconButton _actionIcons({
  required IconData icon,
  required Function() onTap,
}) =>
    IconButton(onPressed: onTap, icon: Icon(icon));
