import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class FeedBlockedPage extends StatelessWidget {
  final String userKey;
  final String docKey;

  const FeedBlockedPage({
    Key? key,
    required this.userKey,
    required this.docKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.clear_rounded),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Container(
          width: size.width,
          height: size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(71, 71, 71, 1),
          ),
          child: Center(
            child: Text(
              '전송하기',
              style: theme.textTheme.bodyText2!.copyWith(
                  color: appSubColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            children: [
              _blockedTextForm(title: '신고 내용을 입력해주세요', maxLines: 20),
              const SizedBox(height: 12),
              _blockedTextForm(
                title: 'E-Mail',
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _blockedTextForm({
    required String title,
    required int maxLines,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: appSubColor,
              size: 15,
            ),
            Text(
              title,
              style: theme.textTheme.bodyText2!
                  .copyWith(color: appSubColor, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(71, 71, 71, 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: theme.textTheme.bodyText2!
                  .copyWith(color: Colors.white, fontSize: 12),
              maxLines: maxLines,
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
