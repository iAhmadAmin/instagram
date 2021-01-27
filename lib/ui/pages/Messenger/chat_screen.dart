import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:get/get.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  ChatScreen({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(children: [
          ProfileWidget(
            onTap: () {},
            size: 20,
            story:
                stories.singleWhere((story) => story.username == user.username),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            user.username,
            style: const TextStyle(color: Colors.black),
          ),
        ]),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
        actions: [
          IconButton(
              icon: const Icon(MyIcons.videocam),
              onPressed: () {
                Get.back();
              }),
          IconButton(
              icon: const Icon(MyIcons.info_outline),
              onPressed: () {
                Get.back();
              })
        ],
      ),
      body: Column(
        children: [
          _chatBar(),
          _writeMessageBar(),
        ],
      ),
    );
  }

  Widget _chatBar() {
    return Expanded(child: Container());
  }

  Widget _writeMessageBar() {
    return Container(
      height: 60,
      width: SizeConfig.screenWidth,
    );
  }
}
