import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget infoBar(
    {@required UserModel user,
    @required Widget widget,
    bool isUserProfile = true}) {
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
                    child: isUserProfile
                        ? ProfileWidget(
                            onTap: () {},
                            size: 48,
                            story: stories.singleWhere(
                                (story) => story.username == user.username,
                                orElse: () => null),
                          )
                        : CircleAvatar(
                            radius: 46,
                            backgroundImage: CachedNetworkImageProvider(user
                                    .userDp ??
                                "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg"),
                          ),
                  ),
                  _counter(count: user.post.toString(), label: "Posts"),
                  _counter(
                      count: user.followers.toString(), label: "Followers"),
                  _counter(
                      count: user.following.toString(), label: "Following"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                user.name,
                style:
                    subHeadingTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              widget,
            ],
          )));
}

Widget _counter({@required String count, @required String label}) {
  return Column(
    children: [
      Text(
        count,
        style: impBodyTextStyle.copyWith(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
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
            color: isFilled ? primaryColor : Colors.black.withOpacity(0.5),
          ),
          color: isFilled ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: child,
        ),
      ));
}

Widget postGrid({@required List<String> urls}) {
  urls.forEach((element) {
    print(element);
  });
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: SizeConfig.screenWidth / 3,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          child: CachedNetworkImage(
            imageUrl: urls[index],
            fit: BoxFit.cover,
          ),
        );
      },
      childCount: urls.length,
    ),
  );
}
