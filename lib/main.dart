import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram/ui/pages/Splash/splash_page.dart';
import 'package:get/get.dart';
import 'ui/styles/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light, //ThemeService().theme,
      home: SplashPage(),
    );
  }
}
