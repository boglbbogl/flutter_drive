import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: Colors.black,
        child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/splash_image_black.png',
              fit: BoxFit.cover,
            )),
      );
    });
  }
}
