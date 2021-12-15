import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
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
              appBar: createAppbarWidget(context: context, submitted: () {}),
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
                      padding: const EdgeInsets.only(left: 11),
                      child: InkWell(
                        onTap: () {
                          pushNewScreen(context, screen: AddressScreen());
                        },
                        child: SizedBox(
                          width: size.width * 0.5,
                          height: size.height * 0.08,
                          child: Row(
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
