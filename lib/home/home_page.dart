import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/feed/ui/page/feed_main_page.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);

    return Scaffold(
      appBar: homeAppbarWidget(context: context),
      body: const FeedMainPage(),
    );
  }
}
