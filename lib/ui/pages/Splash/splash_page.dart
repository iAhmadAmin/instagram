import 'package:flutter/material.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset('assets/images/logo.png'),
          Column(children: [
            Text(
              "from",
              style: subHeadingTextStyle,
            ),
            Text(
              "FACEBOOK",
              style: subHeadingTextStyle,
            ),
          ]),
        ],
      ),
    );
  }
}
