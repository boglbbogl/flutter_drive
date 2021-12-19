import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:image_picker/image_picker.dart';

class ImagesProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  final List<Uint8List> _pickedImages = [];
  Uint8List? _pickedImagesFirst;
  double _isUnderSize = size.height;

  Future<void> imagePicker() async {
    final List<XFile>? _selectedImages = await _imagePicker.pickMultiImage();
    if (_selectedImages != null &&
        _pickedImages.length + _selectedImages.length < 7) {
      for (final images in _selectedImages) {
        _pickedImages.add(await images.readAsBytes());
        _pickedImagesFirst = await images.readAsBytes();
      }
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
  Uint8List? get pickedImagesFirst => _pickedImagesFirst;
  double get isUnderSize => _isUnderSize;
}
