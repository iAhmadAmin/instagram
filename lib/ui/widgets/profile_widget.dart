import 'package:flutter/material.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/ui/styles/colors.dart';

class ProfileWidget extends StatelessWidget {
  final Story story;
  final double size;
  final Function onTap;

  const ProfileWidget(
      {@required this.onTap, @required this.size, @required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size < 30 ? 0.8 : 1.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: story != null
                  ? story.isViewed
                      ? [Colors.grey, Colors.grey]
                      : instaGrad.colors
                  : [Colors.white, Colors.white]),
          //color: Colors.white
        ),
        child: CircleAvatar(
          radius: story != null
              ? story.isViewed
                  ? size
                  : size - 1
              : size,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: size < 30 ? size - 1 : size - 3,
            backgroundImage: story != null
                ? AssetImage(story.userDp)
                : const NetworkImage(
                    "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg"),
          ),
        ),
      ),
    );
  }
}
