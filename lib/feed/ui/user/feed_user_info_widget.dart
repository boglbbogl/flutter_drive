import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/profile_circle_image_widget.dart';

SliverList feedUserInfoWidget({
  required String userImage,
  required String userNickName,
  required String contentLength,
  required String userIntroduction,
  required List<String> cars,
  required bool isMe,
  required Function() profileOnTap,
}) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      profileCircleImageWidget(
                        imageUrl: userImage,
                      ),
                      if (isMe) ...[
                        Positioned(
                          right: -3,
                          top: -2,
                          child: InkWell(
                            onTap: profileOnTap,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkThemeMainColor),
                              child: const Center(
                                  child: Icon(Icons.add_circle_outline,
                                      size: 16, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ],
                  ),
                  const SizedBox(width: 18),
                  _textForm(
                      topTitle: userNickName,
                      bottomTitle: "",
                      topFontSize: 14,
                      topFontColor: const Color.fromRGBO(225, 225, 225, 1)),
                ],
              ),
              _textForm(
                  topTitle: contentLength,
                  bottomTitle: '게시물수',
                  topFontSize: 18,
                  bottomFontWeight: FontWeight.w400,
                  bottomFontColor: const Color.fromRGBO(195, 195, 195, 1))
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              userIntroduction,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(195, 195, 195, 1), fontSize: 11),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.02,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...cars.map((e) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        '#$e',
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 11,
                          color: const Color.fromRGBO(195, 195, 195, 1),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    )
  ]));
}

Column _textForm({
  required String topTitle,
  required String bottomTitle,
  required double topFontSize,
  FontWeight? topFontWeight = FontWeight.bold,
  FontWeight? bottomFontWeight = FontWeight.bold,
  Color? topFontColor = Colors.white,
  Color? bottomFontColor = Colors.white,
}) {
  return Column(
    children: [
      Text(
        topTitle,
        style: theme.textTheme.bodyText2!.copyWith(
            color: topFontColor,
            fontWeight: topFontWeight,
            fontSize: topFontSize),
      ),
      Text(
        bottomTitle,
        style: theme.textTheme.bodyText2!.copyWith(
            color: bottomFontColor, fontWeight: bottomFontWeight, fontSize: 12),
      ),
    ],
  );
}
