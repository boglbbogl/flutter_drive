import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/image/images_provider.dart';
import 'package:provider/provider.dart';

Positioned createImageBottomWidget({
  required BuildContext context,
}) {
  return Positioned(
    bottom: 0,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
          0, context.watch<ImagesProvider>().isUnderSize, 0),
      width: size.width,
      height: size.height * 0.9,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          color: darkThemeMainColor),
      child: Column(
        children: [
          Container(
              width: size.width,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  color: darkThemeMainColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ImagesProvider>()
                          .showMoreImageBottom(value: false);
                    },
                    child: Container(
                      width: size.width * 0.25,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(215, 215, 215, 1)),
                    ),
                  )
                ],
              )),
          Flexible(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0.1,
                crossAxisSpacing: 0.1,
                childAspectRatio: 0.75,
              ),
              children: [
                ...context
                    .watch<ImagesProvider>()
                    .pickedImages!
                    .map((e) => Stack(
                          fit: StackFit.expand,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromRGBO(155, 155, 155, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(e.path),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<ImagesProvider>()
                                      .imageDelete(image: e.path);
                                },
                                child: const Icon(
                                  Icons.remove_circle_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

GestureDetector createImageBottomUpWidget({
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      context.read<ImagesProvider>().showMoreImageBottom(value: false);
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      transform: Matrix4.translationValues(
          0, context.watch<ImagesProvider>().isUnderSize, 0),
      height: size.height * 0.4,
      color: Colors.white24,
    ),
  );
}
