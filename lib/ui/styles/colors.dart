import 'package:get/get.dart';
import 'package:flutter/material.dart';

const lightBackgroundColor = Colors.white;
const darkBackgroundColor = Colors.black;
const primaryColor = Color(0xFF0095F6);
final textColor = Get.isDarkMode ? Colors.white : Colors.black;
final backgroundColor =
    Get.isDarkMode ? darkBackgroundColor : lightBackgroundColor;

LinearGradient instaGrad = const LinearGradient(
  colors: <Color>[
    Color(0xfffcaf45),
    Color(0xfff77737),
    Color(0xfffd1d1d),
    Color(0xffc13584)
  ],
);
