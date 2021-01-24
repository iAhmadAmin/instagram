import 'package:get/get.dart';
import 'package:flutter/material.dart';

const lightBackgroundColor = Colors.white;
const darkBackgroundColor = Colors.black;
final textColor = Get.isDarkMode ? Colors.white : Colors.black;
final backgroundColor =
    Get.isDarkMode ? darkBackgroundColor : lightBackgroundColor;
