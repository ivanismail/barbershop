import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ProfileController extends GetxController {
  //* GET PROFILE
  bool isLoading = false;
  String? name, phone, email, photo;

  //* CAMERA
  File? image;
  String? fileParsed;
  String? imageBase64;

  Future getImageCamera() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image
    final XFile? imagePicked = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1600,
      maxWidth: 1200,
      imageQuality: 80,
    );

    image = File(imagePicked!.path);

    this.fileParsed = base64Encode(File(image!.path).readAsBytesSync());

    String? mime = lookupMimeType(image!.path);
    this.imageBase64 = 'data:$mime;base64,$fileParsed';

    update();

    // await doUpdatePhoto();
  }
}
