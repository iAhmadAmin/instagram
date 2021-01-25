import 'package:flutter/material.dart';
import 'package:instagram/core/models/user.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  final User user;
  EditProfilePage({@required this.user});
  Color backgroundColor = Get.isDarkMode ? Colors.black : Colors.white;
  Color textColor = Get.isDarkMode ? Colors.white : Colors.black;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _bioTextController = TextEditingController();
  TextEditingController _websiteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameTextController.text = user.name;
    _usernameTextController.text = user.username;
    _bioTextController.text = user.bio;
    _websiteTextController.text = user.website;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Get.isDarkMode ? Colors.white : Colors.black),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            }),
        actions: [
          IconButton(
              icon: const Icon(Icons.done, color: primaryColor),
              onPressed: () {
                Get.back();
              })
        ],
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(user.userDp),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Change profile photo",
                      style: TextStyle(color: primaryColor, fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              _inputField(
                label: "Name",
                hint: user.name,
                controller: _nameTextController,
              ),
              _inputField(
                label: "Username",
                hint: user.username,
                controller: _usernameTextController,
              ),
              _inputField(
                label: "Website",
                hint: user.website,
                controller: _websiteTextController,
              ),
              _inputField(
                label: "Bio",
                hint: user.bio,
                controller: _bioTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Switch to Professional account",
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Personal information settings",
                style: TextStyle(color: primaryColor, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  _inputField(
      {@required String label,
      @required String hint,
      @required TextEditingController controller}) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(
        bottom: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "Label",
            style: captionTextStyle,
          ),
          TextFormField(
            maxLines: label == "Bio" ? 2 : 1,
            controller: controller,
            // initialValue: hint,
            // obscureText: isPassField != null ? true : false,
            style: bodyTextStyle.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: bodyTextStyle.copyWith(fontSize: 16),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
