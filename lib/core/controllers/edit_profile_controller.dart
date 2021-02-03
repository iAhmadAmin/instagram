import 'dart:io';

import 'package:get/get.dart';

class EditProfileController extends GetxController {
  File file;
  void updateImageFile(File file) {
    this.file = file;
    update();
  }
}
