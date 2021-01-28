import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class AuthButton extends StatelessWidget {
  final Color btnClr;
  final Function onTap;
  final String label;
  final bool isLoading;
  final Widget loader;

  AuthButton(
      {this.btnClr, this.onTap, this.label, this.isLoading, this.loader});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 46.0,
        decoration: BoxDecoration(
            color: btnClr, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: isLoading == false || isLoading == null
              ? Text(label,
                  style: impBodyTextStyle.copyWith(color: Colors.white))
              : loader,
        ),
      ),
    );
  }
}
