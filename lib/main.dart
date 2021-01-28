import 'package:flutter/material.dart';
import 'package:instagram/ui/pages/Auth/login_page.dart';
import 'package:instagram/ui/pages/Splash/splash_page.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
