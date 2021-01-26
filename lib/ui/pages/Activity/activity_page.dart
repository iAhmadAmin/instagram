import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/models/data.dart';
import 'package:instagram/core/models/activity.dart';
import 'package:instagram/ui/pages/Activity/activity_tile.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        title: Text(
          "Activity",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final Activity activity = activities[index];
              return ActivityTile(activity: activity);
            }),
      ),
    );
  }
}
