import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:flutter_drive/course/ui/widgets/course_appbar_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_explanation_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_image_bottom_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_image_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_season_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_select_button.dart';
import 'package:flutter_drive/course/ui/widgets/course_select_spot_widget.dart';
import 'package:flutter_drive/course/ui/widgets/course_src_keyword_widget.dart';
import 'package:flutter_drive/image/provider/images_provider.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  final TextEditingController _tagController = TextEditingController();
  CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: IgnorePointer(
          ignoring: context.watch<CourseProvider>().isUploading,
          child: Stack(
            children: [
              Scaffold(
                appBar: courseAppbarWidget(context: context),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            courseImageWidget(context: context),
                            courseExplanationWidget(context: context),
                          ],
                        ),
                        if (context
                                .watch<ImagesProvider>()
                                .pickedImages
                                .length >
                            1) ...[
                          Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: TextButton(
                                onPressed: () {
                                  context
                                      .read<ImagesProvider>()
                                      .showMoreImageBottom(value: true);
                                },
                                child: Text(
                                  '이미지 더 보기 ...',
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: appMainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                        courseSrcKeywordWidget(
                          context: context,
                          controller: _tagController,
                        ),
                        courseSeasonWidget(context: context),
                        courseSelectButton(context: context),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ...context
                                  .watch<CourseProvider>()
                                  .courseSpotList
                                  .map(
                                    (spot) =>
                                        CourseSelectSpotWidget(spot: spot),
                                  )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              courseImageBottomUpWidget(context: context),
              courseImageBottomWidget(context: context),
            ],
          ),
        ),
      ),
    );
  }
}
