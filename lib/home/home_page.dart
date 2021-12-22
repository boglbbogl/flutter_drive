import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/ui/address_shimmer_widget.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/feed/ui/feed_main_card.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:flutter_drive/home/home_shimmer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    ? const FeedMainCard()
                    : homeShimmerWidet(),
              );
            }));
  }
}
