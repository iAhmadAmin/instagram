import 'package:flutter/material.dart';
import 'package:instagram/core/controllers/add_post_controller.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  int _selectedCategory = 0;
  List<String> category = [
    "POST",
    "STORY",
    "LIVE",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "New Post",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _selectedMedia(),
          _action(),
          _mediaGallery(),
        ],
      ),
    );
  }

  _selectedMedia() {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.45,
      child: GetX<AddPostController>(
        init: AddPostController(),
        builder: (_controller) {
          // return Image.asset(
          //   _controller.mediaList[_controller.selectedImageIndex].file,
          //   fit: BoxFit.cover,
          // );
          if (_controller.mediaList != null) {
            FutureBuilder(
              future: _controller.mediaList[0].file,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.asset(
                    snapshot.data,
                    fit: BoxFit.cover,
                  );
                }
                return Container();
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  _action() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Gallery",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Center(
                child: Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  _mediaGallery() {
    return Expanded(
      child: GetX<AddPostController>(
        // init: AddPostController(),
        builder: (_controller) {
          return Stack(
            children: [
              GridView.builder(
                itemCount: _controller.mediaList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: _controller.mediaList[index].file,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.file(
                            snapshot.data,
                            fit: BoxFit.cover,
                          ),
                        );
                      }

                      return Container();
                    },
                  );
                },
              ),
              _categoryBar(),
            ],
          );
        },
      ),
    );
  }

  _categoryBar() {
    return Positioned(
      bottom: 8,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(40)),
        height: 45,
        width: 170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _categoryItem(0),
            _categoryItem(1),
            _categoryItem(2),
          ],
        ),
      ),
    );
  }

  _categoryItem(int index) {
    return GestureDetector(
      child: Text(
        category[index],
        style: TextStyle(
          color: _selectedCategory == index ? Colors.white : Colors.grey,
          fontWeight:
              _selectedCategory == index ? FontWeight.w800 : FontWeight.w400,
        ),
      ),
    );
  }
}
