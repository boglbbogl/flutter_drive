import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

Padding profileIntroductionWidget({
  required BuildContext context,
  required TextEditingController controller,
  required String introduction,
  required bool isIntroduction,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              if (isIntroduction) {
                context.read<ProfileProvider>()
                  ..changedIntroduction(value: controller.text)
                  ..showIntroductionWidget(value: false);
              } else {
                context
                    .read<ProfileProvider>()
                    .showIntroductionWidget(value: true);
              }
            },
            child: Row(
              children: [
                Icon(
                  isIntroduction ? Icons.save : Icons.create,
                  color: isIntroduction ? appSubColor : appMainColor,
                  size: 15,
                ),
                const SizedBox(width: 8),
                Text(
                  isIntroduction ? '저장하기' : '수정하기',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: isIntroduction ? appSubColor : appMainColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(91, 91, 91, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: !isIntroduction
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text(
                          introduction.isEmpty ? controller.text : introduction,
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(195, 195, 195, 1),
                              fontSize: 9),
                        ),
                      ),
                    )
                  : TextFormField(
                      maxLines: 10,
                      controller: controller,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: Colors.white, fontSize: 11),
                      decoration: InputDecoration(
                          hintText: '자신을 소개할 수 있는 글을 작성해 주세요',
                          hintStyle: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(175, 175, 175, 1),
                              fontSize: 9),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
            )),
      ],
    ),
  );
}
