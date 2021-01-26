import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/user_action_sheet.dart';

class UserProfilePage extends StatefulWidget {
  final User user;
  UserProfilePage({@required this.user});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _showSuggestion = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _appBar(),
          infoBar(
            user: widget.user,
            widget: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: "Followed by ",
                style: impBodyTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.8),
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          "${users.firstWhere((u) => u.username != widget.user.username).username}, ${users.lastWhere((u) => u.username != widget.user.username).username}",
                      style: subHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                    text: " and ",
                    style: impBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.8)),
                  ),
                  TextSpan(
                      text: "16 others",
                      style: subHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          _buttonBar(),
          _showSuggestion
              ? _suggestionBar()
              : const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
          postGrid(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
        pinned: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.user.username,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              UserActionBTMSheet();
            },
          )
        ]);
  }

  Widget _buttonBar() {
    return SliverToBoxAdapter(
      child: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            button(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Following",
                      style: subHeadingTextStyle.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        size: 16, color: Colors.green)
                  ],
                ),
                width: SizeConfig.screenWidth * 0.408,
                onTap: () {}),
            button(
                child: Text(
                  "Message",
                  style:
                      subHeadingTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                width: SizeConfig.screenWidth * 0.408,
                onTap: () {}),
            button(
                child: Icon(_showSuggestion
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                width: SizeConfig.screenWidth * 0.095,
                onTap: () {
                  setState(() {
                    _showSuggestion = !_showSuggestion;
                  });
                })
          ],
        ),
      ),
    );
  }

  Widget _suggestionBar() {
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
