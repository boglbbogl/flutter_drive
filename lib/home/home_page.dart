import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/feed_provider.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          appBar: homeAppbarWidget(context: context),
          body: Consumer<FeedProvider>(builder: (context, course, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(p.user!.createdAt),
                  Text(p.user!.email),
                  Text(p.user!.nickName),
                  Text(p.user!.userKey),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
