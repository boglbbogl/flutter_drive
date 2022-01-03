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
              const SizedBox(height: 14),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _shimmer(
                                  w: size.width * 0.08,
                                  h: size.height * 0.03,
                                  top: 8),
                              _shimmer(
                                  w: size.width * 0.2,
                                  h: size.height * 0.03,
                                  top: 8,
                                  left: 4),
                            ],
                          ),
                          _shimmer(
                              w: size.width * 0.1,
                              h: size.height * 0.03,
                              top: 8,
                              left: 4),
                        ],
                      ),
                    ),
                    _shimmer(
                        w: size.width,
                        h: size.height * 0.3,
                        top: 8,
                        left: 8,
                        right: 8),
                    _shimmer(
                        w: size.width,
                        h: size.height * 0.06,
                        top: 8,
                        left: 8,
                        right: 8),
                    _shimmer(
                        w: size.width * 0.3,
                        h: size.height * 0.03,
                        top: 8,
                        left: 8,
                        right: 8),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
  );
}

Padding _shimmer({
  required double w,
  required double h,
  double? left = 0,
  double? right = 0,
  double? top = 0,
  double? bottom = 0,
}) {
  return Padding(
    padding:
        EdgeInsets.only(left: left!, right: right!, top: top!, bottom: bottom!),
    child: Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    ),
  );
}
