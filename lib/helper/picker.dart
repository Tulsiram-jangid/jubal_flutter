import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Picker {
  static final ImagePicker _picker = ImagePicker();
  static Future<void> openGallery(ValueChanged<String> onFilePicked) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onFilePicked(pickedFile.path);
    }
  }

  static Future<void> openCamera(ValueChanged<String> onFilePicked) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      onFilePicked(pickedFile.path);
    }
  }
}
