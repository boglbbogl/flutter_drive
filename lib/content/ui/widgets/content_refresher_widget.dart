import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CustomFooter contentRefreshFooter({
  required bool isMain,
  required BuildContext context,
}) {
  return CustomFooter(
    builder: (context, mode) {
      Widget? body;
      if (isMain) {
        if (mode == LoadStatus.idle) {
          body = const Icon(
            Icons.add_circle_outline_rounded,
            color: Color.fromRGBO(175, 175, 175, 1),
          );
        } else if (mode == LoadStatus.loading) {
          body = CircularProgressIndicator(
            color: appMainColor,
          );
        } else if (mode == LoadStatus.failed) {
          body = Icon(
            Icons.error_outline_rounded,
            color: appSubColor,
          );
        } else if (mode == LoadStatus.canLoading) {
          body = const Icon(
            Icons.more_horiz_rounded,
            color: Color.fromRGBO(175, 175, 175, 1),
          );
        } else {
          body = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 18,
                color: appSubColor,
              ),
              const SizedBox(width: 4),
              Text("마지막 피드입니다",
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: appSubColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          );
        }
        return SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: Center(
            child: body,
          ),
        );
      } else {
        return Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 20,
                color: appSubColor,
              ),
              const SizedBox(height: 5),
              Text('더 이상 피드가 없습니다',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: const Color.fromRGBO(175, 175, 175, 1),
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
      }
    },
  );
}
