import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/my_icons.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Get.isDarkMode ? Colors.white : Colors.black),
        title: Text(
          "Settings",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _button(label: "Foolow and invite friends", icon: Icons.person_add),
            _button(label: "Privacy", icon: MyIcons.lock_outline),
            _button(label: "Security", icon: Icons.security),
            _button(label: "Payment", icon: MyIcons.payment),
            _button(label: "Account", icon: MyIcons.account),
            _button(label: "Help", icon: MyIcons.help),
            _button(label: "About", icon: MyIcons.info_outline),
            _button(
                icon: Get.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
                label: Get.isDarkMode ? "Enable lite mode" : "Enable dark mode",
                onTap: () {
                  print("theme change pressed");
                  if (Get.isDarkMode) {
                    Get.changeThemeMode(ThemeMode.light);
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _button(
      {@required String label, @required IconData icon, Function onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
