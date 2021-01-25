import 'package:flutter/material.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  double width;
  SearchBar({this.width});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: width ?? SizeConfig.screenWidth - 30,
        height: 38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[300]),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Get.isDarkMode
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black.withOpacity(0.3),
              )),
          style: TextStyle(
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.6)
                : Colors.black.withOpacity(0.3),
          ),
          cursorColor: Get.isDarkMode
              ? Colors.white.withOpacity(0.6)
              : Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}
