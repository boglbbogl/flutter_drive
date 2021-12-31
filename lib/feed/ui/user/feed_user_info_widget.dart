import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/ui/user_circle_image_widget.dart';

SliverList feedUserInfoWidget({
  required String userImage,
  required String userNickName,
  required String contentLength,
  required String userIntroduction,
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
                  profileCircleImageWidget(
                    imageUrl: userImage,
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
                  color: const Color.fromRGBO(175, 175, 175, 1), fontSize: 10),
            ),
          ),
          Text('차종'),
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
