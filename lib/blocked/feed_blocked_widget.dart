import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/blocked/model/blocked_local_data.dart';
import 'package:flutter_drive/blocked/provider/blocked_provider.dart';
import 'package:provider/provider.dart';

Future feedBlockedWidget({
  required BuildContext context,
  required UserModel user,
  required String blockedDocKey,
}) {
  return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height * 0.8,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Color.fromRGBO(51, 51, 51, 1)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 8, left: size.width * 0.3, right: size.width * 0.3),
                child: Container(
                  width: size.width,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.error_outline_rounded,
                              size: 22, color: appSubColor),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              '????????? ????????? ??? ??? ????????? ??? ????????? ?????? ????????? ?????? ????????? ????????? ????????? ?????? ??? ????????????',
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: appSubColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                          '?????? ???????????? ??? ?????? ????????? ????????? ?????? ?????? ????????? ????????? ????????? ?????? ????????? ????????? ????????? ?????? ?????? ??? ????????????',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(155, 155, 155, 1),
                              fontSize: 12)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: size.width * 0.9,
                        child: Text(
                          '?????? ????????? ????????? ?????????',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: appMainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: size.width * 0.9,
                          height: 1.1,
                          color: const Color.fromRGBO(71, 71, 71, 1)),
                      const SizedBox(height: 10),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ...BlockedLocalData().feed.map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<BlockedProvider>()
                                        .sendBlockedFeed(
                                            userKey: user.userKey,
                                            email: user.email,
                                            blockedDocKey: blockedDocKey,
                                            context: context,
                                            feedCause: e);
                                  },
                                  child: Text(e,
                                      style: theme.textTheme.bodyText2!
                                          .copyWith(fontSize: 15)),
                                ),
                              )),
                          const SizedBox(height: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
