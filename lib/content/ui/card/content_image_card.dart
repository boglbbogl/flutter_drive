import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';

class ContentImageCard extends StatelessWidget {
  final List<String> imageUrl;
  const ContentImageCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrl.length,
      itemBuilder: (context, itemIndex, pageIndex) {
        return SizedBox(
          width: size.width,
          height: size.width,
          child: CachedNetworkImage(
            imageUrl: imageUrl[itemIndex],
            fit: BoxFit.cover,
            placeholder: (context, url) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 185, horizontal: 180),
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: appMainColor,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: false,
        height: size.width,
        // aspectRatio: 16 / 9,
        viewportFraction: 1,
      ),
    );
  }
}
