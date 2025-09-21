import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class RequestController{
  TextEditingController categoryName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController stateName = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController selectItem = TextEditingController();
  TextEditingController noOfItem = TextEditingController();
  TextEditingController msg = TextEditingController();

  File? pickedFile;
  DateTime? selectedDate;

  Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      final ext = path.extension(filePath).toLowerCase();

      if (['.jpg', '.jpeg', '.png', '.pdf'].contains(ext)) {
        pickedFile = File(filePath);
        return null; // success
      } else {
        return "Only JPG, JPEG, PNG, and PDF formats are allowed.";
      }
    }
    return "No file selected.";
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    DateTime threeDaysLater = today.add(const Duration(days: 3));
    final DateTime lastDate = today.add(const Duration(days: 365));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: threeDaysLater,
      firstDate: threeDaysLater,
      lastDate: lastDate,
    );

    if (picked != null) {
      selectedDate = picked;  // store the selected date
    }
  }
}