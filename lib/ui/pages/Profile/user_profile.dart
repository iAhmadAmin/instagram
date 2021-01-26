import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/suggestion_bar.dart';
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
              ? SuggestionBar()
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
}
