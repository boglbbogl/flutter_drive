import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/app_flushbar.dart';
import 'package:image_picker/image_picker.dart';

class ImagesProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  final List<Uint8List> _pickedImages = [];
  double _isUnderSize = size.height;

  Future<void> imagePicker({
    required BuildContext context,
  }) async {
    final List<XFile>? _selectedImages = await _imagePicker.pickMultiImage();
    if (_selectedImages != null &&
        _pickedImages.length + _selectedImages.length < 7) {
      for (final images in _selectedImages) {
        _pickedImages.add(await images.readAsBytes());
        // _pickedImagesFirst = await images.readAsBytes();
      }
    } else {
      await appFlushbar(message: '사진은 6개까지 추가 가능합니다').show(context);
    }
    notifyListeners();
  }

  void imageDelete({
    required Uint8List image,
  }) {
    _pickedImages.removeWhere((element) => element == image);
    notifyListeners();
  }

  void showMoreImageBottom({
    required bool value,
  }) {
    if (value) {
      _isUnderSize = 0;
    } else {
      _isUnderSize = size.height;
    }
    notifyListeners();
  }

  List<Uint8List> get pickedImages => _pickedImages;
  double get isUnderSize => _isUnderSize;
}
