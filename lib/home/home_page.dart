import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/feed/ui/page/feed_main_page.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:flutter_drive/home/home_shimmer_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  final RefreshController _controller = RefreshController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Scaffold(
        appBar: homeAppbarWidget(context: context),
        body: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 700)),
            builder: (context, snapshot) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: snapshot.connectionState == ConnectionState.done
                    ? FeedMainPage()
                    : homeShimmerWidet(),
              );
            }));
  }
}
