import 'package:flutter/material.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:get/get.dart';

class NotificationTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Get.isDarkMode ? Colors.black : Colors.white,
    );
  }
}
