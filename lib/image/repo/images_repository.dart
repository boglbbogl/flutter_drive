import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class ImagesRepository {
  static final ImagesRepository _repository = ImagesRepository._internal();
  factory ImagesRepository() => _repository;
  ImagesRepository._internal();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> userProfileImageUpladResized({
    required Uint8List image,
    required String userKey,
  }) async {
    final String _dateTime = DateTime.now().millisecondsSinceEpoch.toString();
    final appDocDir = await getApplicationDocumentsDirectory();
    final Image? _decodedImage = decodeImage(image);
    final Image _resizedImage =
        copyResize(_decodedImage!, width: 110, height: 110);

    const fileName = '110.jpg';
    final _fileTask = File("${appDocDir.path}/$fileName")
        .writeAsBytes(encodeJpg(_resizedImage));
    final _file = await _fileTask;
    final _imageRef = "user_profile/${userKey}_$_dateTime/0";

    await _storage.ref(_imageRef).putFile(_file);
    final _url = await _storage.ref(_imageRef).getDownloadURL();
    return _url;
  }

  Future<List<String>> imageUploadResized({
    required String userKey,
    required List<Uint8List> imageFile,
  }) async {
    final List<Image?> _decodeImageList = [];
    final List<Image> _resizedImage = [];
    final List<String> _url = [];
    final String _dateTime = DateTime.now().millisecondsSinceEpoch.toString();
    final appDocDir = await getApplicationDocumentsDirectory();
    const fileName = '375.jpg';
    for (final uIntImage in imageFile) {
      _decodeImageList.add(decodeImage(uIntImage));
    }
    for (int i = 0; i < _decodeImageList.length; i++) {
      _resizedImage.add(copyResize(_decodeImageList[i]!, width: 375));
    }

    try {
      for (int i = 0; i < _resizedImage.length; i++) {
        final _fileTask = File("${appDocDir.path}/$fileName")
            .writeAsBytes(encodeJpg(_resizedImage[i]));
        final _file = await _fileTask;
        final _imageRef = "course_images/${userKey}_$_dateTime/$i";
        await _storage.ref(_imageRef).putFile(_file);
        final String _urlString =
            await _storage.ref(_imageRef).getDownloadURL();
        _url.add(_urlString);
      }
    } catch (error) {
      logger.e(error);
    }
    return _url;
  }
}
