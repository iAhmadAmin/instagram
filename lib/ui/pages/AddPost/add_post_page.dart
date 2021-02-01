import 'package:flutter/material.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  List<Widget> _mediaList = [];
  List<AssetEntity> _images = [];
  int currentPage = 0;
  int lastPage;
  var selectedImage;
  int _selectedCategory = 0;
  List<String> category = [
    "POST",
    "STORY",
    "LIVE",
  ];

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    final result = await PhotoManager.requestPermission();
    if (result) {
      // success//load the album list
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
          onlyAll: true, type: RequestType.image);
      final List<AssetEntity> photos = await albums[0].getAssetListPaged(0, 20);
      final List<AssetEntity> newImages =
          await albums[0].getAssetListPaged(0, 20);
      final List<Widget> temp = [];
      for (var asset in photos) {
        temp.add(
          FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(1),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (asset.type == AssetType.video)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5, bottom: 5),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        );
      }

      setState(() {
        _images = newImages;
        _mediaList.addAll(temp);
        currentPage++;
      });

      print(photos);
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

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
      child: FutureBuilder(
        future: _images[0].thumbDataWithSize(200, 200),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.memory(
              snapshot.data,
              fit: BoxFit.cover,
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
      child: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scroll) {
              _handleScrollEvent(scroll);
              return;
            },
            child: GridView.builder(
              itemCount: _mediaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return _mediaList[index];
                // return FutureBuilder(
                //   future: _mediaList[index].thumbDataWithSize(200, 200),
                //   builder: (BuildContext context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       return Padding(
                //         padding: const EdgeInsets.all(1.0),
                //         child: Image.memory(
                //           snapshot.data,
                //           fit: BoxFit.cover,
                //         ),
                //       );
                //     }

                //     return Container();
                //   },
                // );
              },
            ),
          ),
          _categoryBar(),
        ],
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
