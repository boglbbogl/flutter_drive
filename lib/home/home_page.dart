import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';
import 'package:flutter_drive/feed/provider/feed_provider.dart';
import 'package:flutter_drive/home/home_appbar_widget.dart';
import 'package:flutter_drive/home/home_shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    theme = Theme.of(context);
    return Consumer<FeedProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: homeAppbarWidget(context: context),
        body: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 100)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return homeShimmerWidet();
              }
              return ListView(
                children: [
                  ...provider.courseList.map((course) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 8, top: 12),
                            child: Row(
                              children: [
                                userCircleImageWidget(
                                    imageUrl: course.userProfile.isSocialImage
                                        ? course.userProfile.socialProfileUrl
                                        : course.userProfile.localProfileUrl),
                                const SizedBox(width: 8),
                                Text(
                                  course.userProfile.nickName,
                                  style: theme.textTheme.bodyText2!
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
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
                                    placeholder: (context, string) {
                                      return const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 180, horizontal: 180),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 5,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
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
              );
            }),
      );
    });
  }
}
