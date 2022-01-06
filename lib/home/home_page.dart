import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_indicator.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/feed/ui/page/feed_main_page.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    if (context.read<AuthProvider>().user == null) {
      return const AppIndicator();
    }
    return Scaffold(
      appBar: homeAppbarWidget(context: context),
      body: const FeedMainPage(),
    );
  }
}
