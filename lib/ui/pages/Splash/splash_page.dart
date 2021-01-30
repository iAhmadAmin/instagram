import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/controllers/user_controller.dart';
import 'package:instagram/core/services/local_storage.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Auth/login_page.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/pages/Root/root_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final MainController _controller = Get.put(MainController());
  final UserController _userController = Get.put(UserController());

  final Shader linearGradient =
      instaGrad.createShader(const Rect.fromLTWH(0, 0, 200, 40));

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      final bool isLogedIn = LocalStorage().isLogedIn();
      Get.off(isLogedIn ? RootPage() : LoginPage());
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
                    letterSpacing: 0.6,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()..shader = linearGradient),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
