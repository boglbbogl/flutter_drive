import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<FeedProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: homeAppbarWidget(context: context),
        body: ListView(
          children: [
            ...provider.courseList.map((course) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    provider.postUser == null
                        ? Container()
                        : Row(
                            children: [
                              userCircleImageWidget(
                                  imageUrl: provider.postUser!.profileUrl),
                              Text('username'),
                            ],
                          ),
                    SizedBox(
                      width: size.width,
                      height: size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...course.imageUrl.map(
                            (image) => CachedNetworkImage(
                              imageUrl: image,
                              width: size.width,
                              height: size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 2,
                      color: Colors.red,
                    ),
                  ],
                )),
          ],
        ),
      );
    });
  }
}
