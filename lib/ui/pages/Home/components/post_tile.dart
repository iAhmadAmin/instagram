import 'package:flutter/material.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class PostTile extends StatelessWidget {
  final Post post;
  PostTile({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userInfoBar(),
          _mediaBar(),
          _actionBar(),
          _postInfoBar(),
        ],
      ),
    );
  }

  Widget _userInfoBar() {
    return Container(
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(post.userDp),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(post.username, style: impBodyTextStyle),
          const Spacer(),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
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
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _postInfoBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.likes.toString() + " likes",
            style: impBodyTextStyle,
          ),
          // Container(
          //   child: Text(

          //   ),
          // ),
        ],
      ),
    );
  }
}
