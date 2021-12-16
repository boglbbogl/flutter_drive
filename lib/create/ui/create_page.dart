import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/ui/address_screen.dart';
import 'package:flutter_drive/create/provider/course_provider.dart';
import 'package:flutter_drive/create/ui/create_appbar_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * 0.3,
                          height: size.width * 0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromRGBO(51, 51, 51, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.3,
                                height: size.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(71, 71, 71, 1)),
                              ),
                              Text(
                                '1/5',
                                style: theme.textTheme.bodyText2!.copyWith(
                                    color:
                                        const Color.fromRGBO(135, 135, 135, 1),
                                    fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: size.width * 0.6,
                            height: size.width * 0.4,
                            child: TextFormField(
                              onChanged: (value) {
                                context
                                    .read<CourseProvider>()
                                    .getCourseExplanation(value: value);
                              },
                              style: theme.textTheme.bodyText2!
                                  .copyWith(fontSize: 11),
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: null,
                              decoration: const InputDecoration(
                                  hintText: '드라이브 코스에 대한 설명을 작성하세요'),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11, right: 15),
                      child: InkWell(
                        onTap: () => pushNewScreen(context,
                            screen: const AddressScreen()),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '드라이브 코스 추가',
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: appMainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.add_box_outlined,
                                    size: 18,
                                    color: appMainColor,
                                  ),
                                ],
                              ),
                              if (context
                                  .watch<CourseProvider>()
                                  .courseSpotList
                                  .isNotEmpty) ...[
                                Switch(
                                  value: context
                                      .watch<CourseProvider>()
                                      .isSwitcher,
                                  onChanged: (value) {
                                    value = context
                                        .read<CourseProvider>()
                                        .isSwitcher;
                                    context
                                        .read<CourseProvider>()
                                        .showCourseKeywordAndAddress(
                                            value: value);
                                  },
                                  activeColor: appMainColor,
                                  activeTrackColor: appMainColor.withAlpha(150),
                                  inactiveThumbColor:
                                      const Color.fromRGBO(115, 115, 115, 1),
                                  inactiveTrackColor:
                                      const Color.fromRGBO(71, 71, 71, 1),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: ListView(
                        children: [
                          ...context
                              .watch<CourseProvider>()
                              .courseSpotList
                              .map((spot) => Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle_outlined,
                                          size: 18,
                                          color: appSubColor,
                                        ),
                                        const SizedBox(width: 30),
                                        Text(
                                          context
                                                  .watch<CourseProvider>()
                                                  .isSwitcher
                                              ? spot.addressName
                                              : spot.placeName,
                                          style: theme.textTheme.bodyText2!
                                              .copyWith(
                                                  color: const Color.fromRGBO(
                                                      195, 195, 195, 1),
                                                  fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
