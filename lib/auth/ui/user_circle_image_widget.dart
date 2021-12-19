import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CircleAvatar userCircleImageWidget({
  required String imageUrl,
}) {
  return CircleAvatar(
    backgroundColor: Colors.white,
    radius: 14,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipOval(
        child: CachedNetworkImage(
            placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ),
                ),
            fit: BoxFit.cover,
            fadeOutDuration: const Duration(milliseconds: 1),
            imageUrl: imageUrl),
      ),
    ),
  );
}
