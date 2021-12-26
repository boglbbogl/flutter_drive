import 'package:flutter/material.dart';
import 'package:flutter_drive/course/model/course_model.dart';
import 'package:flutter_drive/feed/content/provider/content_provider.dart';
import 'package:flutter_drive/feed/user/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FeedUserMainPage extends StatelessWidget {
  const FeedUserMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              ...provider.courseList.map(
                (e) => Text(e.userKey),
              )
            ],
          ),
        );
      },
    );
  }
}
