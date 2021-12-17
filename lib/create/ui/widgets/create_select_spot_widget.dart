import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/create/model/course_model.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:provider/provider.dart';

class CreateSelectSpotWidget extends StatelessWidget {
  final CourseSpot spot;
  const CreateSelectSpotWidget({
    Key? key,
    required this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            size: 18,
            color: appSubColor,
          ),
          if (context.watch<CourseProvider>().isSwitcher)
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: spot.addressName));
                // show snackbar
              },
              child: const SizedBox(
                width: 40,
                child: Icon(
                  Icons.copy_outlined,
                  size: 18,
                  color: Color.fromRGBO(215, 215, 215, 1),
                ),
              ),
            )
          else
            const SizedBox(width: 40),
          SizedBox(
            width: size.width * 0.6,
            child: Text(
              context.watch<CourseProvider>().isSwitcher
                  ? spot.addressName
                  : spot.placeName,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color.fromRGBO(195, 195, 195, 1), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
