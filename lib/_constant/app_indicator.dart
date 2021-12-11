import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(
          color: appMainColor,
        ),
      ),
    );
  }
}
