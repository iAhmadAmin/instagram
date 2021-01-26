import 'package:get/get.dart';

class MainController extends GetxController {
  bool isMenuOpened = false;
  bool isDark = Get.isDarkMode;

  void updateTheme() {
    isDark = !isDark;
    update();
  }

  void controlMenu() {
    isMenuOpened = !isMenuOpened;
    update();
  }
}
