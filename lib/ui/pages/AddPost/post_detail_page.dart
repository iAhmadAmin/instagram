import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class PostDetail extends StatelessWidget {
  final File imgFile;
  const PostDetail({this.imgFile});

  @override
  Widget build(BuildContext context) {
    print("Post Image Path:  " + imgFile.path.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "New Post",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: [
        _post(),
      ]),
    );
  }

  _post() {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            //backgroundImage: AssetImage(Get.find<UserController>().user.userDp),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write a caption...",
                hintStyle: bodyTextStyle.copyWith(color: Colors.grey),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Spacer(),
          //Image.file(File(postImgPath)),
        ],
      ),
    );
  }
}
