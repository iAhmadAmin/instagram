import 'package:get/get.dart';

class MainController extends GetxController {
  bool isMenuOpened = false;
  bool isCommentTFOpend = false;

  void controlMenu() {
    isMenuOpened = !isMenuOpened;
    update();
  }

  void controlCommentTF() {
    isCommentTFOpend = !isCommentTFOpend;
    update();
  }
}
