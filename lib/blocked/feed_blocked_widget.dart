import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/model/user_model.dart';
import 'package:flutter_drive/blocked/provider/blocked_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/blocked/model/blocked_local_data.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.error_outline_rounded,
                        size: 22, color: appSubColor),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: size.width * 0.7,
                      child: Text(
                        '신고를 접수한 이 후 취소할 수 없으며 허위 신고시 해당 서비스 이용에 제한이 생길 수 있습니다',
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
                    '해당 컨텐츠는 더 이상 자신의 피드에 노출 되지 않으며 접수된 결과에 따라 서비스 전체에 노출을 하지 않을 수 있습니다',
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(155, 155, 155, 1),
                        fontSize: 12)),
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width * 0.9,
                  child: Text(
                    '신고 이유를 선택해 주세요',
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
                  shrinkWrap: true,
                  children: [
                    ...BlockedLocalData().feed.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: InkWell(
                            onTap: () {
                              context.read<BlockedProvider>().sendBlockedFeed(
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
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
