import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.grey[100],
      // primaryColor: primaryClr,
      brightness: Brightness.light,
      fontFamily: "Poppins");
  static final dark = ThemeData(
      // backgroundColor: darkGreyClr,
      brightness: Brightness.dark,
      // primaryColor: darkHeaderClr,
      fontFamily: "Poppins");
}
