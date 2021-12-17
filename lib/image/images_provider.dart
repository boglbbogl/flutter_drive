import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:image_picker/image_picker.dart';

class ImagesProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _pickedImages = [];
  double _isUnderSize = size.height;

  Future<void> imagePicker() async {
    final List<XFile>? _selectedImages = await _imagePicker.pickMultiImage();
    if (_selectedImages != null &&
        _pickedImages.length + _selectedImages.length < 7) {
      _pickedImages.addAll(_selectedImages);
    }
    notifyListeners();
  }

  void imageDelete({
    required String image,
  }) {
    _pickedImages.removeWhere((element) => element.path == image);
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

  List<XFile>? get pickedImages => _pickedImages;
  double get isUnderSize => _isUnderSize;
}
