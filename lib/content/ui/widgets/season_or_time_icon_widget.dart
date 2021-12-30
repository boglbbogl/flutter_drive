import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';

Column timeIconWidget({
  required List<String> time,
}) {
  return Column(
    children: [
      if (time.contains("1") && !time.contains("2")) ...[
        _timeIcons(icon: Icons.wb_sunny)
      ],
      if (time.contains("2") && !time.contains("1")) ...[
        _timeIcons(icon: Icons.mode_night)
      ],
      if (time.contains("1") && time.contains("2")) ...[
        _timeIcons(icon: Icons.wb_sunny_outlined, size: 11),
        _timeIcons(icon: Icons.mode_night_outlined, size: 11)
      ],
    ],
  );
}

Row seasonIconWidget({
  required List<String> season,
}) {
  return Row(
    children: [
      if (season.contains("1")) ...[
        _seasonIcons(icon: CustomIcon.cloudSunEmpty),
      ],
      if (season.contains("2")) ...[
        _seasonIcons(icon: CustomIcon.windyRainEmpty),
      ],
      if (season.contains("3")) ...[
        _seasonIcons(icon: CustomIcon.snowHeavyEmpty),
      ],
    ],
  );
}

Padding _seasonIcons({
  required IconData icon,
  double? size = 10,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 4),
    child: Icon(
      icon,
      size: size,
      color: appMainColor,
    ),
  );
}

Icon _timeIcons({
  required IconData icon,
  double? size = 12,
}) {
  return Icon(
    icon,
    size: size,
    color: appMainColor,
  );
}
