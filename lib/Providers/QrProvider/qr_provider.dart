import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';
import 'package:virtual_exchange/utlis.dart';

class QrProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  void getGalleryImage() async {
    imageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      getQrCodeFromGallery();
    }
  }

  void getQrCodeFromGallery() async {
    try {
      String? result = await Scan.parse(imageFile!.path);
      if (result == null) {
        errorSnack("Invalid QR");
      }
      logger.i(result);
    } on Exception catch (_) {
      errorSnack('Unable to Scan');
    }
  }
}
