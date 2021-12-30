import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/custom_icon.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:provider/provider.dart';

Row courseTagKeywordWidget({
  required BuildContext context,
  required TextEditingController controller,
}) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          _tagAddTextBottom(context: context, controller: controller);
        },
        icon: const Icon(
          CustomIcon.tag,
          size: 22,
        ),
        color: appSubColor,
      ),
      SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.03,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            ...context.watch<CourseProvider>().srcsKeyword.map((e) => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                          height: size.height * 0.03,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: appSubColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 15),
                            child: Center(child: Text(e)),
                          )),
                    ),
                    Positioned(
                      right: -2,
                      top: -5,
                      child: InkWell(
                        onTap: () {
                          context
                              .read<CourseProvider>()
                              .hashTagsKeyword(srcKeyword: e);
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkThemeCardColor),
                          child: const Icon(
                            Icons.remove_circle_outline_rounded,
                            size: 12,
                            color: Color.fromRGBO(195, 195, 195, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      )
    ],
  );
}

Future _tagAddTextBottom({
  required BuildContext context,
  required TextEditingController controller,
}) {
  return showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height * 0.65,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            color: Color.fromRGBO(71, 71, 71, 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.2,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appSubColor),
                ),
              ),
              SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: TextFormField(
                    controller: controller,
                    onFieldSubmitted: (value) {
                      context
                          .read<CourseProvider>()
                          .hashTagsKeyword(srcKeyword: value);
                      logger.e(context.read<CourseProvider>().srcsKeyword);
                      controller.clear();
                    },
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                        hintText: ' 태그를 입력해 주세요',
                        hintStyle: theme.textTheme.bodyText2!.copyWith(
                            color: const Color.fromRGBO(195, 195, 195, 1),
                            fontSize: 14),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  )),
            ],
          ),
        );
      });
}
