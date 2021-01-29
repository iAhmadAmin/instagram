import 'package:flutter/material.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/ui/pages/Messenger/chat_screen.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';

class MessageTile extends StatelessWidget {
  final UserModel user;

  const MessageTile({this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ChatScreen(
          user: user,
        ));
      },
      child: Container(
        // height: 70,
        width: SizeConfig.screenWidth,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(user.userDp),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.username,
                  style: impBodyTextStyle,
                ),
                Text(
                  "send you a message . 2 d",
                  style: bodyTextStyle.copyWith(
                      color: Colors.black.withOpacity(0.9)),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                MyIcons.camera,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
