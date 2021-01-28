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
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class PostTile extends StatefulWidget {
  final Post post;
  const PostTile({@required this.post});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  final FlareControls flareControls = FlareControls();
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
            tag: widget.post.username,
            child: ProfileWidget(
              onTap: () {
                Get.to(
                  UserProfilePage(
                    user: users.singleWhere(
                        (user) => user.username == widget.post.username),
                  ),
                );
              },
              size: 18,
              story: stories.singleWhere(
                  (story) => story.username == widget.post.username),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.post.username, style: impBodyTextStyle),
              widget.post.location != null
                  ? Text(widget.post.location, style: captionTextStyle)
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
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          flareControls.play("like");
          widget.post.isLiked ? null : widget.post.likePost();
        });
      },
      child: Container(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(widget.post.postAsset),
          SizedBox(
            height: 160.0,
            width: 160.0,
            child: Center(
              child: FlareActor(
                'assets/animation/heart.flr',
                controller: flareControls,
                animation: 'idle',
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _actionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          _actionButton(
              icon: widget.post.isLiked ? MyIcons.heart_active : MyIcons.heart,
              clr: widget.post.isLiked ? Colors.red : Colors.black,
              onTap: () {
                setState(() {
                  widget.post.likePost();
                });
              }),
          _actionButton(icon: MyIcons.comment, onTap: () {}),
          _actionButton(icon: MyIcons.send, onTap: () {}),
          const Spacer(),
          _actionButton(icon: MyIcons.bookmark, onTap: () {}),
        ],
      ),
    );
  }

  Widget _actionButton(
      {IconData icon, Function onTap, Color clr = Colors.black}) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: 22,
          color: clr,
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
            widget.post.likes.toString() + " likes",
            style: impBodyTextStyle,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: widget.post.postDesc != null ? 3 : 0),
            child: widget.post.postDesc != null
                ? RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: widget.post.username + " ",
                      style: impBodyTextStyle,
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.post.postDesc, style: bodyTextStyle),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: widget.post.comments.length != 0 ? 3 : 0),
            child: widget.post.comments.length != 0
                ? Text(
                    "View all ${widget.post.comments.length} comments",
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
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Add a comment...",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white10,
                    width: 0,
                  ),
                ),
              ),
              style: captionTextStyle,
            ),
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
