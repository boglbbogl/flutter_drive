import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/recommendation/recommendation_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';

SizedBox routeCourseWidget({
  required BuildContext context,
}) {
  return SizedBox(
    height: size.height * 0.17,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ...context
            .read<RecommendationProvider>()
            .routeCourseList
            .map((course) => Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: InkWell(
                    onDoubleTap: () {
                      context.read<RecommendationProvider>().routeCourseLike();
                    },
                    child: Container(
                      width: size.width * 0.28,
                      height: size.height * 0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.6,
                            child: SizedBox(
                              width: size.width * 0.28,
                              height: size.height * 0.17,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: course.imageUrl,
                                  fit: BoxFit.fill,
                                  fadeOutDuration:
                                      const Duration(milliseconds: 1),
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50, horizontal: 35),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: appMainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.28,
                            height: size.height * 0.17,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black54),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(course.title,
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Container(
                                      width: size.width * 0.28,
                                      height: 0.3,
                                      color: const Color.fromRGBO(
                                          175, 175, 175, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ...course.spot.map(
                                          (spot) => Row(
                                            children: [
                                              Icon(Icons.circle,
                                                  size: 4, color: appMainColor),
                                              const SizedBox(width: 3),
                                              Text(
                                                  spot.placeName.length > 15
                                                      ? "${spot.placeName.substring(0, 15)} ..."
                                                      : spot.placeName,
                                                  style: theme
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              225, 225, 225, 1),
                                                          fontSize: 9)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            left: 10,
                            child: Row(
                              children: [
                                Icon(CustomIcon.heart,
                                    size: 8, color: appMainColor),
                                const SizedBox(width: 6),
                                Text("좋아요 ${course.likeUserKey.length}개",
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: const Color.fromRGBO(
                                            195, 195, 195, 1),
                                        fontSize: 7)),
                              ],
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child:
                                !context.watch<RecommendationProvider>().isLike
                                    ? Container()
                                    : const Center(
                                        child: Icon(CustomIcon.heart,
                                            color: Colors.white, size: 32)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
      ],
    ),
  );
}
