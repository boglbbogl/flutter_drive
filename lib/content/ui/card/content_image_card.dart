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
        return Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.width,
              child: CachedNetworkImage(
                imageUrl: imageUrl[itemIndex],
                fit: BoxFit.cover,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 185, horizontal: 180),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: appMainColor,
                  ),
                ),
              ),
            ),
            if (imageUrl.length > 1) ...[
              Positioned(
                bottom: 10,
                left: 10,
                child: SizedBox(
                  height: size.height * 0.03,
                  width: size.width * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: imageUrl.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            pageIndex == index
                                ? Icons.circle
                                : Icons.circle_outlined,
                            size: 10,
                            color: appMainColor,
                          ),
                        );
                      }),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black45),
                  child: Center(
                      child: Text(
                    "${pageIndex + 1}/${imageUrl.length}",
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ],
          ],
        );
      },
      options: CarouselOptions(
          enableInfiniteScroll: false,
          height: size.width,
          // aspectRatio: 16 / 9,
          viewportFraction: 1,
          onPageChanged: (index, reason) {}),
    );
  }
}
