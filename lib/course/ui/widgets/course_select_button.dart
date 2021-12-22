import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/ui/address_screen.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

Padding courseSelectButton({
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 11, right: 15),
    child: InkWell(
      onTap: () => pushNewScreen(context, screen: const AddressScreen()),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '드라이브 코스 추가',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appMainColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.add_box_outlined,
                  size: 18,
                  color: appMainColor,
                ),
              ],
            ),
            if (context.watch<CourseProvider>().courseSpotList.isNotEmpty) ...[
              Switch(
                value: context.watch<CourseProvider>().isSwitcher,
                onChanged: (value) {
                  value = context.read<CourseProvider>().isSwitcher;
                  context
                      .read<CourseProvider>()
                      .showCourseKeywordAndAddress(value: value);
                },
                activeColor: appMainColor,
                activeTrackColor: appMainColor.withAlpha(150),
                inactiveThumbColor: const Color.fromRGBO(115, 115, 115, 1),
                inactiveTrackColor: const Color.fromRGBO(71, 71, 71, 1),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
