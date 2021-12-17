import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:provider/provider.dart';

SizedBox createExplanationWidget({
  required BuildContext context,
}) {
  return SizedBox(
      width: size.width * 0.6,
      height: size.width * 0.4,
      child: TextFormField(
        onChanged: (value) {
          context.read<CourseProvider>().getCourseExplanation(value: value);
        },
        style: theme.textTheme.bodyText2!.copyWith(fontSize: 11),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: null,
        decoration: const InputDecoration(hintText: '드라이브 코스에 대한 설명을 작성하세요'),
      ));
}
