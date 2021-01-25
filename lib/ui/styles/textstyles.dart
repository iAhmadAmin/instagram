import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/colors.dart';

/// NAME       SIZE   WEIGHT   SPACING  2018 NAME
/// display4   112.0  thin     0.0      headline1
/// display3   56.0   normal   0.0      headline2
/// display2   45.0   normal   0.0      headline3
/// display1   34.0   normal   0.0      headline4
/// headline   24.0   normal   0.0      headline5
/// title      20.0   medium   0.0      headline6
/// subhead    16.0   normal   0.0      subtitle1
/// body2      14.0   medium   0.0      body1 (bodyText1)
/// body1      14.0   normal   0.0      body2 (bodyText2)
/// caption    12.0   normal   0.0      caption
/// button     14.0   medium   0.0      button
/// subtitle   14.0   medium   0.0      subtitle2
/// overline   10.0   normal   0.0      overline
/// ```

TextStyle get headingTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subHeadingTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get titleTextStle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get bodyTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get impBodyTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get captionTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode
            ? Colors.white.withOpacity(0.85)
            : Colors.black.withOpacity(0.85)),
  );
}

TextStyle get ovrelineTextStyle {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[600]),
  );
}
