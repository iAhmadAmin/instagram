import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  const UserProfilePage({@required this.user});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(),
        _infoBar(),
      ],
    );
  }

  Widget _appBar() {
    return SliverAppBar(
        pinned: true,
        backgroundColor: backgroundColor,
        title: Text(user.username),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: textColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: textColor,
            ),
            onPressed: () {},
          )
        ]);
  }

  Widget _infoBar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Hero(
              tag: user.username,
              child: ProfileWidget(
                onTap: () {},
                size: 46,
                story: stories
                    .singleWhere((story) => story.username == user.username),
              ),
            )
          ],
        ),
      ),
    );
  }
}
