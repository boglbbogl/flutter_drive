import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageRepository {
  static final ImageRepository _repository = ImageRepository._internal();
  factory ImageRepository() => _repository;
  ImageRepository._internal();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final List<Uint8List> _byteImageList = [];
  final List<Image?> _decodeImageList = [];
  final List<Image> _resizedImage = [];

  Future<List<String>> imageUploadResized({
    required String userKey,
    required List<XFile> imageFile,
  }) async {
    imageFile.map((e) async {
      _byteImageList.add(await e.readAsBytes());
      // logger.e(e);
    });
    if (_byteImageList.isNotEmpty) {
      _byteImageList.map((e) {
        return _decodeImageList.add(decodeImage(e));
      });
      for (int i = 0; i < _decodeImageList.length; i++) {
        _resizedImage.add(copyResize(_decodeImageList[i]!, width: 375));
      }
    }

    logger.d(_resizedImage);
    return [];
  }
}
