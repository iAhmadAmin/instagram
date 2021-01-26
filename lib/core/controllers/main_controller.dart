import 'package:get/get.dart';

class MainController extends GetxController {
  bool isMenuOpened = false;

  void controlMenu() {
    isMenuOpened = !isMenuOpened;
    update();
  }
}
