import 'package:flutter/material.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';

class StoryWidget extends StatelessWidget {
  final Story story;
  final bool isMe;
  const StoryWidget({@required this.story, this.isMe = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isMe
              ? Stack(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: backgroundColor,
                      child: const CircleAvatar(
                        radius: 31,
                        backgroundImage: AssetImage("assets/images/dp.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: backgroundColor,
                        child: const CircleAvatar(
                          radius: 8.5,
                          backgroundColor: primaryColor,
                          child: Icon(
                            MyIcons.add,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ProfileWidget(
                  onTap: () {},
                  size: 34,
                  story: story,
                ),
          Text(
            isMe ? "Your story" : story.username,
            style: story.isViewed
                ? bodyTextStyle.copyWith(color: Colors.grey)
                : bodyTextStyle,
          ),
        ],
      ),
    );
  }
}
