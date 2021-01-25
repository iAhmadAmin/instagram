import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';
import 'package:get/get.dart';

List<String> photos = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
  "assets/images/5.jpg",
  "assets/images/6.jpg",
  "assets/images/7.jpg",
  "assets/images/8.jpg",
  "assets/images/9.jpg",
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
  "assets/images/5.jpg",
];

Widget infoBar({@required User user, @required Widget widget}) {
  return SliverToBoxAdapter(
    child: Container(
        padding: const EdgeInsets.only(left: 12, right: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: user.username,
                  child: ProfileWidget(
                    onTap: () {},
                    size: 48,
                    story: stories.singleWhere(
                        (story) => story.username == user.username,
                        orElse: () => null),
                  ),
                ),
                _counter(count: user.post.toString(), label: "Posts"),
                _counter(count: user.followers.toString(), label: "Followers"),
                _counter(count: user.following.toString(), label: "Following"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              user.name,
              style: subHeadingTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            widget,
          ],
        )),
  );
}

Widget _counter({@required String count, @required String label}) {
  return Column(
    children: [
      Text(
        count,
        style: impBodyTextStyle.copyWith(
            fontSize: 22, fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        label,
        style: captionTextStyle.copyWith(
            fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget postGrid() {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: SizeConfig.screenWidth / 3,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Image.asset(
          photos[index],
          fit: BoxFit.cover,
        );
      },
      childCount: photos.length,
    ),
  );
}

Widget button(
    {bool isFilled = false,
    double height = 36,
    @required Widget child,
    @required double width,
    @required Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: isFilled
              ? primaryColor
              : Get.isDarkMode
                  ? Colors.white.withOpacity(0.5)
                  : Colors.black.withOpacity(0.5),
        ),
        color: isFilled
            ? primaryColor
            : Get.isDarkMode
                ? Colors.black
                : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: child,
      ),
    ),
  );
}
