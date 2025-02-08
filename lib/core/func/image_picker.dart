import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> selectImage({required int choice}) async {
  File? image =
      await extractImage(choice: choice); // 1 for gallery, 2 for camera
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future<File?> extractImage({required int choice}) async {
  final ImagePicker picker = ImagePicker();
  ImageSource source = choice == 1 ? ImageSource.gallery : ImageSource.camera;

  final XFile? pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    return File(pickedFile.path); // Convert XFile to File
  }
  return null; // Return null if no image is selected
}
