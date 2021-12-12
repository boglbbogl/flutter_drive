import 'package:flutter/material.dart';
import 'package:flutter_drive/_app/drive.dart';
import 'package:flutter_drive/splash/splash_screen.dart';

class DriveApp extends StatelessWidget {
  const DriveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 2000), () => 0),
      builder: (context, snapshot) {
        // switcher duration 테스트 중
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: _splashLoadingWidget(snapshot),
        );
      },
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      return Text('hasError : ${snapshot.hasError}');
    } else if (snapshot.hasData) {
      return const Drive();
    } else {
      return const SplashScreen();
    }
  }
}
