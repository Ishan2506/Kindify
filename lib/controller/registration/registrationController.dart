import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindify_app/utils/toast_service.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RegistrationController {
  final TextEditingController trustName = TextEditingController();
  final TextEditingController adminName = TextEditingController();
  final TextEditingController mobileNum = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController darpanId = TextEditingController();
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp mobileRegex = RegExp(r'^[6-9]\d{9}$');
  File? pickedFile;
  
  //final ImagePicker _picker = ImagePicker();

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


  Future<void> register(BuildContext context) async{
    String TrustName = trustName.text.trim();
    String AdminName = adminName.text.trim();
    String MobileNo = mobileNum.text.trim();
    String Email = email.text.trim();
    String DarpanId = darpanId.text.trim();

    if(TrustName.isEmpty && AdminName.isEmpty && MobileNo.isEmpty && Email.isEmpty && DarpanId.isEmpty){
      ToastService.showError(context, "All the fields are required!");
    }
    else if(!_emailRegex.hasMatch(Email)){
      ToastService.showError(context, "Please enter valid email address!");
    }
    else if(!mobileRegex.hasMatch(MobileNo)){
      ToastService.showError(context, "Please enter valid phone number");
    }
    else{
      try{
        var uri = Uri.parse("https://kindify-backend.onrender.com/auth/trust/register");
        var request = http.MultipartRequest("POST", uri);

        final mimeTypes = {
          'jpg': MediaType('image', 'jpeg'),
          'jpeg': MediaType('image', 'jpeg'),
          'png': MediaType('image', 'png'),
          'pdf': MediaType('application', 'pdf'),
        };

        final ext = pickedFile!.path.split('.').last.toLowerCase();
        final contentType = mimeTypes[ext];

        if(contentType == null){
          ToastService.showError(context, "Unsupported file type!");
        }

        request.fields['trustName'] = TrustName;
        request.fields['adminName'] = AdminName;
        request.fields['mobile'] = MobileNo;
        request.fields['email'] = Email;
        request.fields['darpanId'] = DarpanId;
        debugPrint("${pickedFile}_ ${pickedFile!.path}");
        request.files.add(
          await http.MultipartFile.fromPath('darpanCertificate', pickedFile!.path,contentType: contentType),
        );

        var response = await request.send();
        String json = await response.stream.bytesToString();
        var jsonRes = jsonDecode(json);
        if(response.statusCode == 200){
          ToastService.showSuccess(context, "${jsonRes["message"]}");
        }
        else{
          //String body = await response.stream.bytesToString();
          //debugPrint("Error :- ${jsonRes["message"]}");
          ToastService.showError(context, "${jsonRes["message"]}");
        }

      }catch(e){
        ToastService.showError(context,"Error:- ${e.toString()}");
      }
    }
  }
}
