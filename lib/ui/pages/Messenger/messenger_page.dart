import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/ui/pages/Messenger/message_tile.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/search_bar.dart';

class MessengerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "i_ahmadamin",
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
        actions: [
          IconButton(icon: const Icon(MyIcons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(MyIcons.edit), onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "Messages",
              style: titleTextStle,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final UserModel user = users[index];
                    return MessageTile(user: user);
                  })),
        ],
      ),
    );
  }
}
