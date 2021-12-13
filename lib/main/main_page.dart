import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/main/main_appbar_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<AuthProvider>(
      builder: (c, p, child) {
        if (p.user == null) {
          return Container();
        }
        return Scaffold(
          appBar: mainAppbarWidget(context: context),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(p.user!.createdAt),
                Text(p.user!.email),
                Text(p.user!.nickName),
                Text(p.user!.userKey),
              ],
            ),
          ),
        );
      },
    );
  }
}
