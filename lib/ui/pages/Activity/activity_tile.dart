import 'package:flutter/material.dart';
import 'package:instagram/core/models/activity.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 70,
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(activity.userDp),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: activity.userName + " ",
                style: impBodyTextStyle,
                children: <TextSpan>[
                  TextSpan(text: activity.notification, style: bodyTextStyle),
                  TextSpan(text: " " + activity.time, style: captionTextStyle),
                ],
              ),
            ),
          ),
          activity.isFollower
              ? const SizedBox()
              : button(
                  isFilled: true,
                  child: const Text(
                    "Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 100,
                  onTap: () {}),
        ],
      ),
    );
  }
}
