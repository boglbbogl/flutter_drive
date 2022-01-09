import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/setting/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class ComplainAnswerPage extends StatelessWidget {
  const ComplainAnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                _appbarActionForm(
                    title: '처리 중',
                    lenght: context
                        .read<SettingProvider>()
                        .complainNoAnswer
                        .toString(),
                    color: appSubColor),
                const SizedBox(width: 12),
                _appbarActionForm(
                    title: '답변완료',
                    lenght: context
                        .read<SettingProvider>()
                        .complainAnswer
                        .toString(),
                    color: appMainColor),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              ...context.watch<SettingProvider>().complainList.map((complain) =>
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(71, 71, 71, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(complain.isAnswer ? '답변완료' : '처리 중',
                                          style: theme.textTheme.bodyText2!
                                              .copyWith(
                                                  color: complain.isAnswer
                                                      ? appMainColor
                                                      : appSubColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 6),
                                      Text(
                                        "${complain.category} 문의",
                                        style: theme.textTheme.bodyText2!
                                            .copyWith(
                                                color: const Color.fromRGBO(
                                                    215, 215, 215, 1),
                                                fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    complain.createAt
                                        .toString()
                                        .substring(0, 10),
                                    style: theme.textTheme.bodyText2!.copyWith(
                                      color: const Color.fromRGBO(
                                          195, 195, 195, 1),
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(complain.explanation,
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      color: const Color.fromRGBO(
                                          215, 215, 215, 1),
                                      fontSize: 10)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Container(
                                  width: size.width,
                                  height: 0.3,
                                  color: Colors.white,
                                ),
                              ),
                              if (complain.isAnswer) ...[
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.08),
                                    SizedBox(
                                      width: size.width * 0.75,
                                      child: RichText(
                                          text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: '@ROUTE66Team  ',
                                              style: theme.textTheme.bodyText2!
                                                  .copyWith(
                                                      color: appMainColor,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          TextSpan(
                                              text: complain.answer,
                                              style: theme.textTheme.bodyText2!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10)),
                                        ],
                                      )),
                                    ),
                                  ],
                                )
                              ],
                              if (!complain.isAnswer) ...[
                                Row(
                                  children: [
                                    const SizedBox(width: 30),
                                    Container(
                                      width: size.width * 0.15,
                                      height: 0.3,
                                      color: const Color.fromRGBO(
                                          155, 155, 155, 1),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '답변이 없습니다',
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(
                                              color: const Color.fromRGBO(
                                                  155, 155, 155, 1),
                                              fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                              const SizedBox(height: 12),
                            ],
                          ),
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Row _appbarActionForm({
    required String title,
    required String lenght,
    required Color color,
  }) {
    return Row(
      children: [
        Text("$title ",
            style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(195, 195, 195, 1),
              fontSize: 12,
            )),
        Text(
          lenght,
          style: theme.textTheme.bodyText2!.copyWith(
              fontSize: 14, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
