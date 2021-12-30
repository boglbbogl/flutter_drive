import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:provider/provider.dart';

SizedBox addressItemSelectedWidget({
  required BuildContext context,
}) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.03,
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ...context.watch<CourseProvider>().courseSpotList.map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Center(
                            child: Text(
                          e.placeName,
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(215, 215, 215, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                  Positioned(
                      right: -3,
                      top: -3,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: darkThemeMainColor),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              context.read<CourseProvider>().getCourseSpotList(
                                  courseSpot: e, context: context);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_rounded,
                              color: Color.fromRGBO(215, 215, 215, 1),
                              size: 15,
                            )),
                      ))
                ],
              ),
            )),
      ],
    ),
  );
}
