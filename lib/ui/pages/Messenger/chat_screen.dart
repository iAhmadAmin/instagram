import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:get/get.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/widgets/message_buble.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';

class ChatScreen extends StatelessWidget {
  final List<MessageBubble> messageBubbles = [];

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
    return Expanded(
      child: ListView.builder(
        itemCount: messagesList.length,
        itemBuilder: (context, index) {
          final MessageBubble messageBubble =
              MessageBubble(message: messagesList[index]);
          return messageBubble;
        },
      ),
    );
  }

  Widget _writeMessageBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 20),
      height: 52,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 20,
                  child: Center(
                    child: Icon(MyIcons.camera_filled, color: Colors.white),
                  ))),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: TextField(
            cursorColor: primaryColor,
            decoration: InputDecoration(
              hintText: "Message...",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey[350],
                width: 0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey[350],
                width: 0,
              )),
            ),
          )),
          const SizedBox(
            width: 6,
          ),
          const Icon(MyIcons.mic, color: Colors.black),
          const SizedBox(
            width: 12,
          ),
          const Icon(MyIcons.photo, color: Colors.black),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}
