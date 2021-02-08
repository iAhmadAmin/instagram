import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/controllers/add_post_controller.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/AddPost/gallery_page.dart';

class AddPostPage extends StatelessWidget {
  AddPostController _addPostController = Get.put(AddPostController());
  List<String> _category = [
    "POST",
    "STORY",
    "LIVE",
  ];

  List<Widget> _pages = [
    GalleryPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            GetBuilder<AddPostController>(
              builder: (_controller) {
                return _pages[_controller.selectedCategory];
              },
            ),
            _categoryBar()
          ],
        ),
      ),
    );
  }

  _categoryBar() {
    return GetBuilder<AddPostController>(
      builder: (_controller) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: 8,
          left: SizeConfig.screenWidth * 0.40 -
              (_controller.selectedCategory * 50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(40)),
            height: 45,
            width: getProportionateScreenWidth(180),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _categoryItem(0, _controller),
                _categoryItem(1, _controller),
                _categoryItem(2, _controller),
              ],
            ),
          ),
        );
      },
    );
  }

  _categoryItem(int index, AddPostController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: () {
          controller.updateCategory(index);
        },
        child: Text(
          _category[index],
          style: TextStyle(
            letterSpacing: 1.0,
            color: controller.selectedCategory == index
                ? Colors.white
                : Colors.grey,
            fontWeight: controller.selectedCategory == index
                ? FontWeight.w800
                : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
