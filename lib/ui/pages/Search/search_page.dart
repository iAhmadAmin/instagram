import 'package:flutter/material.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/pages/Search/category_item.dart';
import 'package:instagram/ui/widgets/search_bar.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                SearchBar(
                  width: SizeConfig.screenWidth - 60,
                ),
                const Spacer(),
                const Icon(
                  MyIcons.qr_code,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                  children: List.generate(searchCategories.length, (index) {
                return CategoryStoryItem(
                  name: searchCategories[index],
                );
              })),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: photos.length,
              itemBuilder: (BuildContext context, int index) => Image.asset(
                photos[index],
                fit: BoxFit.cover,
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          )
        ],
      ),
    );
  }
}
