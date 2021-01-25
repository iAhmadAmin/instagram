import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/widgets/search_bar.dart';

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
            SearchBar(),
            _button(label: "Foolow and invite friends", icon: Icons.person_add),
            _button(label: "Privacy", icon: MyIcons.lock_outline),
            _button(label: "Security", icon: Icons.security),
            _button(label: "Payment", icon: MyIcons.payment),
            _button(label: "Account", icon: MyIcons.account),
            _button(label: "Help", icon: MyIcons.help),
            _button(label: "About", icon: MyIcons.info_outline),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add pr switch accounts",
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "log out i_ahmadamin",
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "log out of all accounts",
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  )
                ],
              ),
            )
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
