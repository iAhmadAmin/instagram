import 'package:get/get.dart';

class MainController extends GetxController {
  bool isMenuOpened = false;
  bool isCommentTFOpend = false;
  bool isLoading = false;

  void controlMenu() {
    isMenuOpened = !isMenuOpened;
    update();
  }

  void controlCommentTF() {
    isCommentTFOpend = !isCommentTFOpend;
    update();
  }

  void changeLoading() {
    print(
        "...........................change loading callled........................");
    isLoading = !isLoading;
    update();
  }
}
