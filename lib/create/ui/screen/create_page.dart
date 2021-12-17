import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/create/ui/widgets/create_appbar_widget.dart';
import 'package:flutter_drive/create/ui/widgets/create_course_select_button.dart';
import 'package:flutter_drive/create/ui/widgets/create_explanation_widget.dart';
import 'package:flutter_drive/create/ui/widgets/create_image_bottom_widget.dart';
import 'package:flutter_drive/create/ui/widgets/create_image_widget.dart';
import 'package:flutter_drive/create/ui/widgets/create_select_spot_widget.dart';
import 'package:flutter_drive/image/images_provider.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Scaffold(
              appBar: createAppbarWidget(context: context),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          createImageWidget(context: context),
                          createExplanationWidget(context: context),
                        ],
                      ),
                      if (context.watch<ImagesProvider>().pickedImages!.length >
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
                      createCourseSelectButton(context: context),
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
                                  (spot) => CreateSelectSpotWidget(spot: spot),
                                )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            createImageBottomUpWidget(context: context),
            createImageBottomWidget(context: context),
          ],
        ),
      ),
    );
  }
}
