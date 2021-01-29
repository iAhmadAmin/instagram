import 'package:flutter/material.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassField;

  const InputField({
    this.hint,
    this.controller,
    this.isPassField = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showPass = false;

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
        controller: widget.controller,
        obscureText: widget.isPassField && !showPass ? true : false,
        style: bodyTextStyle,
        decoration: InputDecoration(
          suffix: widget.isPassField
              ? GestureDetector(
                  child: Icon(Icons.remove_red_eye,
                      color: showPass ? primaryColor : Colors.grey),
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )
              : const SizedBox(),
          hintText: widget.hint,
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
