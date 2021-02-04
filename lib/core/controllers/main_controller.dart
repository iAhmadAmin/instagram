import 'package:get/get.dart';

class MainController extends GetxController {
  bool isMenuOpened = false;
  bool isCommentTFOpend = false;
  bool isLoading = false;
  int currentRootTab = 0;

  void updateCurrentRootTab(int index) {
    currentRootTab = index;
    update();
  }

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
