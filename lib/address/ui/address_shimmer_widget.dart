import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerListWidget() {
  return Shimmer.fromColors(
    baseColor: const Color.fromRGBO(91, 91, 91, 1),
    highlightColor: Colors.grey,
    child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, indez) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Container(
              width: size.width,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color.fromRGBO(115, 115, 115, 1), width: 2.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.4,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                  ),
                  Container(
                    width: size.width * 0.6,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}
