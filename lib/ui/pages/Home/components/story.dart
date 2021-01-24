import 'package:flutter/material.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';

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
                      radius: 33,
                      backgroundColor: textColor,
                      child: const CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage("assets/images/dp.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 11.2,
                        backgroundColor: textColor,
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: primaryColor,
                          child: Icon(
                            MyIcons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: LinearGradient(
                        colors: story.isViewed
                            ? [Colors.grey, Colors.grey]
                            : instaGrad.colors),
                    //color: Colors.white
                  ),
                  child: CircleAvatar(
                    radius: story.isViewed ? 34 : 33,
                    backgroundColor: backgroundColor,
                    child: CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage(story.userDp),
                    ),
                  ),
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
