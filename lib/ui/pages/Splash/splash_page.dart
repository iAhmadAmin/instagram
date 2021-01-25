import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/pages/Root/root_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Shader linearGradient =
      instaGrad.createShader(const Rect.fromLTWH(0, 0, 200, 40));

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.off(RootPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              height: 90,
            ),
            Column(children: [
              Text(
                "from",
                style: subHeadingTextStyle,
              ),
              Text(
                "FACEBOOK",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
