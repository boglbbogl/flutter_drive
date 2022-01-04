import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

Padding profileTextFormWidget(
    {required TextEditingController controller,
    required Function(String) onFieldSubmitted,
    required Function() onTap,
    required String hintText,
    required double horizontal}) {
  return Padding(
    padding: EdgeInsets.only(left: horizontal, right: horizontal),
    child: Row(
      children: [
        SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.06,
          child: TextFormField(
              controller: controller,
              onFieldSubmitted: onFieldSubmitted,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: theme.textTheme.bodyText2!.copyWith(
                    color: const Color.fromRGBO(155, 155, 155, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              )),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          onPressed: onTap,
          icon: const Icon(Icons.add_box, color: Colors.white),
        ),
      ],
    ),
  );
}
