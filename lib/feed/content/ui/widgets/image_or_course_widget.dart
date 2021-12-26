import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/feed/content/provider/content_provider.dart';
import 'package:provider/provider.dart';

Stack contentCourseWidget({
  required BuildContext context,
  required String startPlaceName,
  required String endPlaceName,
  required int index,
}) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: size.height * 0.05,
        color: const Color.fromRGBO(115, 115, 115, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            children: [
              Text(
                startPlaceName,
                style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: size.width * 0.05,
                  height: 1,
                  color: appSubColor,
                ),
              ),
              Text(
                endPlaceName,
                style: theme.textTheme.bodyText2!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      _changedButtonForm(
          // onTap: () {},
          widget: TextButton(
              onPressed: () =>
                  context.read<ContentProvider>().isShowImageOrCourseSpot(
                        index: index,
                        value: false,
                      ),
              child: Text(
                '경로보기',
                style: theme.textTheme.bodyText2!
                    .copyWith(color: appMainColor, fontSize: 12),
              )))
    ],
  );
}

Stack contentImageWidget({
  required BuildContext context,
  required List<String> imageUrls,
  required int index,
}) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: size.height * 0.05,
        color: const Color.fromRGBO(37, 38, 54, 1),
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...imageUrls.map(
                (image) => SizedBox(
                  width: size.width * 0.12,
                  height: size.height * 0.07,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      _changedButtonForm(
        onTap: () => context.read<ContentProvider>().isShowImageOrCourseSpot(
              index: index,
              value: true,
            ),
        widget: Icon(
          Icons.double_arrow_rounded,
          color: appMainColor,
        ),
      ),
    ],
  );
}

Positioned _changedButtonForm({
  Function()? onTap,
  required Widget widget,
}) {
  return Positioned(
      right: 15,
      top: 5,
      bottom: 5,
      child: InkWell(
        onTap: onTap,
        child: widget,
      ));
}
