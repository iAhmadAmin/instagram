import 'package:flutter/material.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/pages/Profile/edit_profile_page.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class MyProfilePage extends StatelessWidget {
  final User user = User(
    username: "i_ahmadamin",
    userDp: "assets/images/dp.jpg",
    name: "Ahmad Amin",
    post: 141,
    followers: 23,
    following: 213,
    website: "http://github.com/iahmadamin",
    bio: "Programmer\nStudent\nFlutter Developer",
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      _appBar(),
      infoBar(
          user: user,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.bio),
              Text(
                user.website,
                style: const TextStyle(color: primaryColor),
              )
            ],
          )),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 20,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: button(
              child: Text(
                "Edit Profile",
                style:
                    subHeadingTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              width: SizeConfig.screenWidth * 0.85,
              onTap: () {
                Get.to(EditProfilePage(user: user));
              }),
        ),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 26,
        ),
      ),
      postGrid(),
    ]);
  }

  Widget _appBar() {
    return SliverAppBar(
        pinned: true,
        backgroundColor: backgroundColor,
        title: Text(
          user.username,
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: textColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: textColor,
            ),
            onPressed: () {},
          )
        ]);
  }
}
