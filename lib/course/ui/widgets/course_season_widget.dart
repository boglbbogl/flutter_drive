import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:provider/provider.dart';

Padding courseSeasonWidget({
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _seasonSelectedButton(
                value: 1, context: context, icon: CustomIcon.cloudSunEmpty),
            _seasonSelectedButton(
                value: 2, context: context, icon: CustomIcon.windyRainEmpty),
            _seasonSelectedButton(
                value: 3, context: context, icon: CustomIcon.snowHeavyEmpty),
          ],
        ),
        Container(
          width: size.width * 0.2,
          height: size.width * 0.09,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(91, 91, 91, 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timeSelectedButton(
                  value: 1,
                  context: context,
                  icon: context
                          .watch<CourseProvider>()
                          .driveTime
                          .contains(1.toString())
                      ? Icons.wb_sunny_rounded
                      : Icons.wb_sunny_outlined),
              _timeSelectedButton(
                  value: 2,
                  context: context,
                  icon: context
                          .watch<CourseProvider>()
                          .driveTime
                          .contains(2.toString())
                      ? Icons.mode_night_rounded
                      : Icons.mode_night_outlined),
            ],
          ),
        ),
      ],
    ),
  );
}

InkWell _timeSelectedButton({
  required BuildContext context,
  required IconData icon,
  required int value,
}) {
  return InkWell(
    onTap: () {
      context
          .read<CourseProvider>()
          .driveTimeAddOrRemove(value: value.toString());
    },
    child: Container(
      width: size.width * 0.1,
      height: size.width * 0.09,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.1,
              color: context
                      .watch<CourseProvider>()
                      .driveTime
                      .contains(value.toString())
                  ? appMainColor
                  : const Color.fromRGBO(115, 115, 115, 1)),
          borderRadius: value == 1
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))
              : const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
          color: const Color.fromRGBO(91, 91, 91, 1)),
      child: Icon(
        icon,
        size: 18,
        color:
            context.watch<CourseProvider>().driveTime.contains(value.toString())
                ? appMainColor
                : const Color.fromRGBO(195, 195, 195, 1),
      ),
    ),
  );
}

Padding _seasonSelectedButton({
  required IconData icon,
  required BuildContext context,
  required int value,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 2, right: 2),
    child: InkWell(
      onTap: () {
        context
            .read<CourseProvider>()
            .driveSeasonAddOrRemove(value: value.toString());
      },
      child: Container(
        width: size.width * 0.09,
        height: size.width * 0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 1.2,
                color: context
                        .watch<CourseProvider>()
                        .driveSeason
                        .contains(value.toString())
                    ? const Color.fromRGBO(91, 91, 91, 1)
                    : darkThemeCardColor),
            color: const Color.fromRGBO(91, 91, 91, 1)),
        child: Icon(
          icon,
          color: context
                  .watch<CourseProvider>()
                  .driveSeason
                  .contains(value.toString())
              ? appMainColor
              : const Color.fromRGBO(195, 195, 195, 1),
          size: 18,
        ),
      ),
    ),
  );
}
