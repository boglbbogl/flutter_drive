import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:shimmer/shimmer.dart';

Shimmer homeShimmerWidet() {
  return Shimmer.fromColors(
    baseColor: const Color.fromRGBO(91, 91, 91, 1),
    highlightColor: Colors.grey,
    child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 8, top: 12),
                child: Row(
                  children: [
                    _shimmer(w: 30, h: size.height * 0.04, r: 50),
                    const SizedBox(width: 10),
                    _shimmer(w: 80, h: size.height * 0.04, r: 12),
                  ],
                ),
              ),
              _shimmer(w: size.width, h: size.width, r: 12),
              const SizedBox(height: 12),
            ],
          );
        }),
  );
}

Container _shimmer({
  required double w,
  required double h,
  required double r,
}) {
  return Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(r),
      color: Colors.white,
    ),
  );
}
