import 'package:flutter/material.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';

Future<dynamic> UserActionBTMSheet() {
  return Get.bottomSheet(
    Container(
      height: SizeConfig.screenHeight * 0.4,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(4)),
            ),
          ),
          Text(
            "Report...",
            style: impBodyTextStyle,
          ),
          Text(
            "Turn on post notifications",
            style: impBodyTextStyle,
          ),
          Text(
            "Copy link",
            style: impBodyTextStyle,
          ),
          Text(
            "Share to...",
            style: impBodyTextStyle,
          ),
          Text(
            "Unfollow",
            style: impBodyTextStyle,
          ),
          Text(
            "Mute",
            style: impBodyTextStyle,
          ),
          const SizedBox(),
        ],
      ),
    ),
  );
}
