import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Home/components/post_tile.dart';
import 'package:instagram/ui/pages/Home/components/story.dart';
import '../../../my_icons.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Color backgroundColor = Get.isDarkMode ? Colors.black : Colors.white;
  Color textColor = Get.isDarkMode ? Colors.white : Colors.black;
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
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      title: Image.asset(
        "assets/images/insta_logo.png",
        height: 44,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      actions: [
        IconButton(
          icon: Icon(
            MyIcons.messenger,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {},
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
              color: Get.isDarkMode
                  ? Colors.white.withOpacity(0.12)
                  : Colors.black.withOpacity(0.12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _postBar() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Post post = posts[index];
          return PostTile(post: post);
        },
        childCount: posts.length,
      ),
    );
  }
}
