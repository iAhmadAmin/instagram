import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/core/services/database.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Home/components/post_tile.dart';
import 'package:instagram/ui/pages/Home/components/story.dart';
import 'package:instagram/ui/pages/Messenger/messenger_page.dart';
import '../../../my_icons.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(),
        _storyBar(),
        _postBar(),
      ],
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      title: Image.asset(
        "assets/images/insta_logo.png",
        height: 44,
        color: Colors.black,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            MyIcons.messenger,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(MessengerPage());
          },
        )
      ],
    );
  }

  Widget _storyBar() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 105,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return StoryWidget(story: Story(), isMe: true);
                    } else {
                      final Story story = stories[index - 1];
                      return StoryWidget(
                        story: story,
                      );
                    }
                  }),
            ),
            Divider(
              color: Colors.black.withOpacity(0.12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postBar() {
    return StreamBuilder<QuerySnapshot>(
      stream: Database().allPostStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return snapshot.hasData
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var doc = snapshot.data.docs[index];
                    final Post post = Post(
                        caption: doc['caption'],
                        comments: doc['comments'],
                        likes: doc['likes'],
                        location: doc['location'],
                        userDpUrl: doc['userDpUrl'],
                        username: doc['username'],
                        postImgUrl: doc['imgUrl']);
                    return PostTile(post: post);
                  },
                  childCount: snapshot.data.docs.length,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
