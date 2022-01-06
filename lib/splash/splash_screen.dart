import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: Colors.white,
        child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/background_image.jpg',
              fit: BoxFit.cover,
            )),
      );
    });
  }
}
