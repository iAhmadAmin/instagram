import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/user_profile.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/widgets/profile_widget.dart';
import 'package:instagram/ui/widgets/user_action_sheet.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userInfoBar(),
          _mediaBar(),
          _actionBar(),
          _postInfoBar(),
          _addCommentBar(),
          _timeStamp(),
        ],
      ),
    );
  }

  Widget _userInfoBar() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: Row(
        children: [
          Hero(
            tag: post.username,
            child: ProfileWidget(
              onTap: () {
                Get.to(
                  UserProfilePage(
                    user: users
                        .singleWhere((user) => user.username == post.username),
                  ),
                );
              },
              size: 18,
              story: stories
                  .singleWhere((story) => story.username == post.username),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(post.username, style: impBodyTextStyle),
              post.location != null
                  ? Text(post.location, style: captionTextStyle)
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          IconButton(
              icon: const Icon(Icons.more_vert, size: 20),
              onPressed: () {
                UserActionBTMSheet();
              })
        ],
      ),
    );
  }

  Widget _mediaBar() {
    return Container(
      child: Image.asset(post.postAsset),
    );
  }

  Widget _actionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          _actionButton(icon: MyIcons.heart, onTap: () {}),
          _actionButton(icon: MyIcons.comment, onTap: () {}),
          _actionButton(icon: MyIcons.send, onTap: () {}),
          const Spacer(),
          _actionButton(icon: MyIcons.bookmark, onTap: () {}),
        ],
      ),
    );
  }

  Widget _actionButton({IconData icon, Function onTap}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: 22,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _postInfoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.likes.toString() + " likes",
            style: impBodyTextStyle,
          ),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: post.postDesc != null ? 3 : 0),
            child: post.postDesc != null
                ? RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: post.username + " ",
                      style: impBodyTextStyle,
                      children: <TextSpan>[
                        TextSpan(text: post.postDesc, style: bodyTextStyle),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: post.comments.length != 0 ? 3 : 0),
            child: post.comments.length != 0
                ? Text(
                    "View all ${post.comments.length} comments",
                    style: captionTextStyle,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _addCommentBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/dp.jpg"),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            "Add a comment...",
            style: captionTextStyle,
          ),
          const Spacer(),
          const Text("👌   😂   ➕ ")
        ],
      ),
    );
  }

  Widget _timeStamp() {
    return Container(
      padding: const EdgeInsets.only(top: 4, left: 8),
      child: Text(
        "1 hour ago",
        style: captionTextStyle.copyWith(fontSize: 10),
      ),
    );
  }
}
