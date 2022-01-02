import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

Padding profilePrivacyWidget({
  required bool userPrivacyBookmarks,
  required bool userPrivacyLikes,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.lock_outlined,
              size: 16,
              color: appMainColor,
            ),
            const SizedBox(width: 8),
            Text(
              '비공개 설정',
              style: theme.textTheme.bodyText2!.copyWith(
                  color: appMainColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _privacyForm(
            isSwitch: userPrivacyLikes,
            title: "좋아요 비공개",
            onChanged: (value) {
              context.read<ProfileProvider>().changedPrivacyLikes(value: value);
            }),
        _privacyForm(
            isSwitch: userPrivacyBookmarks,
            title: "북마크 비공개",
            onChanged: (value) {
              context
                  .read<ProfileProvider>()
                  .changedPrivacyBookmarks(value: value);
            }),
      ],
    ),
  );
}

Padding _privacyForm({
  required bool isSwitch,
  required String title,
  required Function(bool) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: Color.fromRGBO(215, 215, 215, 1),
              size: 8,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: theme.textTheme.bodyText2!.copyWith(
                fontSize: 11,
                color: const Color.fromRGBO(215, 215, 215, 1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.035,
          child: Switch(
            value: isSwitch,
            onChanged: onChanged,
            activeColor: appMainColor,
            activeTrackColor: appMainColor.withAlpha(150),
            inactiveThumbColor: const Color.fromRGBO(115, 115, 115, 1),
            inactiveTrackColor: const Color.fromRGBO(71, 71, 71, 1),
          ),
        )
      ],
    ),
  );
}
