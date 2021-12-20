import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

AppBar profileAppbarWidget({
  required BuildContext context,
}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: TextButton(
          onPressed: () {},
          child: Text(
            '완료',
            style: theme.textTheme.bodyText2!
                .copyWith(color: const Color.fromRGBO(115, 115, 115, 1)),
          ),
        ),
      ),
    ],
  );
}
