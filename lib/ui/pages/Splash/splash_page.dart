import 'package:flutter/material.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xfffcaf45),
      Color(0xfff77737),
      Color(0xfffd1d1d),
      Color(0xffc13584)
    ],
  ).createShader(Rect.fromLTWH(0.0, 1.0, 200, 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              height: 100,
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
