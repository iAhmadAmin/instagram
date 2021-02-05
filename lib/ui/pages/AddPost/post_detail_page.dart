import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/controllers/add_post_controller.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/controllers/user_controller.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/services/database.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class PostDetail extends StatelessWidget {
  final File imgFile;
  PostDetail({this.imgFile});

  TextEditingController _captionTextController = TextEditingController();
  TextEditingController _locationTextController = TextEditingController();

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
          style: const TextStyle(color: Colors.black),
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
          GetBuilder<MainController>(builder: (value) {
            return value.isLoading
                ? const CircularProgressIndicator()
                : IconButton(
                    icon: const Icon(Icons.done, color: primaryColor),
                    onPressed: () {
                      _createPost();
                    },
                  );
          }),
        ],
      ),
      body: _postDetail(),
    );
  }

  _postDetail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _post(),
      const Divider(
        color: Colors.grey,
        height: 10,
        thickness: 0.3,
      ),
      _tile(label: "Tag People", onTap: () {}),
      const Divider(
        color: Colors.grey,
        height: 10,
        thickness: 0.3,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: _locationTextController,
          decoration: InputDecoration(
            hintText: "Add location",
            hintStyle:
                bodyTextStyle.copyWith(color: Colors.black, fontSize: 16),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      const Divider(
        color: Colors.grey,
        height: 10,
        thickness: 0.3,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text("Also post to"),
      ),
      _tile(
          label: "Facebook",
          onTap: () {},
          widget: Switch(value: false, onChanged: (val) {})),
      const SizedBox(
        height: 6,
      ),
      _tile(
          label: "Twitter",
          onTap: () {},
          widget: Switch(value: false, onChanged: (val) {})),
      const SizedBox(
        height: 6,
      ),
      _tile(
          label: "Tumblr",
          onTap: () {},
          widget: Switch(value: false, onChanged: (val) {})),
      const SizedBox(height: 6),
      const Divider(
        color: Colors.grey,
        height: 10,
        thickness: 0.3,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text("Advanced settings"),
      )
    ]);
  }

  _post() {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              Get.find<UserController>().user.userDp,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              controller: _captionTextController,
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
          SizedBox(
            height: 60,
            width: 60,
            child: Image.file(
              File(imgFile.path),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  _tile({String label, Function onTap, Widget widget}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 8),
        height: 35,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            widget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  _createPost() async {
    final Post post = Post(
      caption: _captionTextController.text ?? "",
      location: _locationTextController.text ?? "",
      imgFile: imgFile,
      likes: [],
      comments: {},
      userDpUrl: Get.find<UserController>().user.userDp,
      username: Get.find<UserController>().user.username,
    );
    Database().createPost(post: post);
  }
}
