import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Home/components/post_tile.dart';
import 'package:instagram/ui/pages/Home/components/story.dart';
import 'package:instagram/ui/styles/colors.dart';
import '../../../my_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          _appBar(),
          _storyBar(),
          _postBar(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: backgroundColor,
      title: Image.asset(
        "assets/images/insta_logo.png",
        height: 50,
        color: textColor,
      ),
      actions: [
        IconButton(
          icon: Icon(
            MyIcons.messenger,
            color: textColor,
          ),
          onPressed: () {},
        )
      ],
    );

    // Container(
    //   padding: const EdgeInsets.only(left: 16, right: 10),
    //   width: SizeConfig.screenWidth,
    //   height: 60,
    //   decoration: BoxDecoration(
    //     color: backgroundColor,
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       // const Text(
    //       //   "Instagram",
    //       //   style: TextStyle(
    //       //     fontFamily: "Billabong",
    //       //     fontSize: 34,
    //       //     fontWeight: FontWeight.w400,
    //       //   ),
    //       // ),
    //       Image.asset(
    //         "assets/images/insta_logo.png",
    //         height: 50,
    //         color: textColor,
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           MyIcons.messenger,
    //           color: textColor,
    //         ),
    //         onPressed: () {},
    //       )
    //     ],
    //   ),
    // );
  }

  Widget _storyBar() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 94,
        width: SizeConfig.screenWidth,
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
