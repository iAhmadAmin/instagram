import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class SuggestionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Suggested for you",
                  style:
                      subHeadingTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "See All",
                  style: subHeadingTextStyle.copyWith(color: primaryColor),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            width: SizeConfig.screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final User user = users[index];
                  return _miniUserProfile(user: user);
                }),
          ),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }

  Widget _miniUserProfile({@required User user}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      height: 200,
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundImage: AssetImage(user.userDp),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(user.username, style: impBodyTextStyle),
          const SizedBox(height: 4),
          Text(
            user.name,
            style: captionTextStyle,
          ),
          const Spacer(),
          button(
              isFilled: true,
              height: 30,
              child: const Text(
                "Follow",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              width: 130,
              onTap: () {}),
        ],
      ),
    );
  }
}
