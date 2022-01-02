import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/model/course_model.dart';

Container feedNotImageWidget({
  required CourseModel feed,
}) {
  return Container(
    color: const Color.fromRGBO(71, 71, 71, 1),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _feedNotImageTextForm(title: feed.spot.firstOrNull!.placeName),
              const SizedBox(height: 12),
              _feedNotImageMoreIcon(),
              const SizedBox(height: 4),
              _feedNotImageMoreIcon(),
              const SizedBox(height: 4),
              _feedNotImageMoreIcon(),
              const SizedBox(height: 12),
              _feedNotImageTextForm(title: feed.spot.lastOrNull!.placeName),
              if (feed.spot.length > 2) ...[
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
        if (feed.spot.length > 2) ...[
          Positioned(
            bottom: 10,
            child: Container(
              width: size.width,
              height: 30,
              color: const Color.fromRGBO(51, 51, 51, 1),
              child: DefaultTextStyle(
                style: theme.textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(215, 215, 215, 1), fontSize: 9),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      feed.spot[1].placeName.length > 15
                          ? "${feed.spot[1].placeName.substring(0, 15)}..."
                          : feed.spot[1].placeName,
                    ),
                    Text(feed.spot.length > 3 ? "..." : ""),
                    Text(feed.spot.length > 3
                        ? " + ${feed.spot.length - 3}"
                        : ""),
                  ],
                ),
              ),
            ),
          )
        ],
      ],
    ),
  );
}

SizedBox _feedNotImageMoreIcon() {
  return SizedBox(
      width: size.width,
      child: Icon(Icons.circle, color: appMainColor, size: 8));
}

Text _feedNotImageTextForm({
  required String title,
}) {
  return Text(title.length > 17 ? "${title.substring(0, 17)}..." : title,
      style: theme.textTheme.bodyText2!.copyWith(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold));
}
