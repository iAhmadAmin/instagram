import 'package:flutter/material.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassField;

  const InputField({
    this.hint,
    this.controller,
    this.isPassField = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8.0)),
      child: TextFormField(
        controller: controller,
        obscureText: isPassField ? true : false,
        style: bodyTextStyle,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: bodyTextStyle.copyWith(color: Colors.grey),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white10,
              width: 0,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white10,
              width: 0,
            ),
          ),
        ),
      ),
    );
  }
}
