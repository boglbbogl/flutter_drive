import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/image/images_provider.dart';
import 'package:provider/provider.dart';

Container createImageWidget({
  required BuildContext context,
}) {
  return Container(
    width: size.width * 0.3,
    height: size.width * 0.35,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(51, 51, 51, 1)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.read<ImagesProvider>().imagePicker();
          },
          child: Container(
            width: size.width * 0.3,
            height: size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(71, 71, 71, 1)),
            child: context.watch<ImagesProvider>().pickedImages!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(context
                          .watch<ImagesProvider>()
                          .pickedImages!
                          .first
                          .path),
                      fit: BoxFit.fill,
                    ),
                  )
                : const Icon(
                    Icons.add_circle_outline_outlined,
                    color: Color.fromRGBO(135, 135, 135, 1),
                    size: 40,
                  ),
          ),
        ),
        Text(
          "${context.watch<ImagesProvider>().pickedImages!.length.toString()}/6",
          style: theme.textTheme.bodyText2!.copyWith(
              color: const Color.fromRGBO(135, 135, 135, 1), fontSize: 9),
        ),
        const SizedBox()
      ],
    ),
  );
}
