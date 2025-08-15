import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class RegistrationController {
  final TextEditingController trustName = TextEditingController();
  final TextEditingController adminName = TextEditingController();
  final TextEditingController mobileNum = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController darpanId = TextEditingController();

  File? pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      final ext = path.extension(pickedFile.path).toLowerCase();
      if (ext == '.jpg' || ext == '.jpeg' || ext == '.png') {
        pickedImage = File(pickedFile.path);
        return null; // success, no error
      } else {
        return "Only JPG, JPEG, and PNG formats are allowed.";
      }
    }
    return null; // No file selected
  }
}
