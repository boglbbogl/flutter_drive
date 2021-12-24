import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Padding feedExplanationCard({
  required BuildContext context,
  required String nickName,
  required String explanation,
  required int index,
  required int explanationIndex,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: SizedBox(
      width: size.width,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "$nickName  ",
            style: theme.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            )),
        TextSpan(
            text: provider.explanationIndex != index &&
                    provider.courseList[index].explanation.length > 20
                ? provider.courseList[index].explanation.substring(0, 20)
                : provider.courseList[index].explanation,
            style: theme.textTheme.bodyText2!.copyWith(
                fontSize: 10, color: const Color.fromRGBO(215, 215, 215, 1))),
        if (provider.explanationIndex != index &&
            provider.courseList[index].explanation.length > 20) ...[
          TextSpan(
            text: ' ...더 보기',
            style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(155, 155, 155, 1),
              fontSize: 11,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap =
                  () => provider.isShowExplanation(index: index, value: true),
          ),
        ],
      ])),
    ),
  );
}
