import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/core/controllers/user_controller.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/core/services/database.dart';
import 'package:instagram/core/services/local_storage.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Profile/components.dart';
import 'package:instagram/ui/pages/Profile/edit_profile_page.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final MainController _controller = Get.find<MainController>();

  final UserController _userController = Get.find<UserController>();

  // bool isLoading = false;
  // UserModel user;

  // _getUserData() async {
  //   isLoading = true;
  //   _userController.user =
  //       await Database().getUserData(email: LocalStorage().getUserEmail());
  //   user = _userController.user;
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getUserData();
  // } // Text(snapshot.data.get('website'));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Database().userDataStream(email: LocalStorage().getUserEmail()),
        builder: (context, snapshot) {
          if (snapshot.hasError ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final UserModel user =
              UserModel.fromDocumentSnapshot(doc: snapshot.data);
          return CustomScrollView(slivers: [
            _appBar(user.username),
            infoBar(
                isUserProfile: false,
                user: user,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.bio),
                    Text(
                      user.website,
                      style: const TextStyle(color: primaryColor),
                    )
                  ],
                )),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: button(
                    child: Text(
                      "Edit Profile",
                      style: subHeadingTextStyle.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    width: SizeConfig.screenWidth * 0.85,
                    onTap: () {
                      Get.to(EditProfilePage(user: user));
                    }),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 26,
              ),
            ),
            postGrid(),
          ]);
        });
  }

  Widget _appBar(String username) {
    return SliverAppBar(
        pinned: true,
        backgroundColor: Colors.white,
        title: Text(
          username,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _controller.controlMenu();
            },
          )
        ]);
  }
}
