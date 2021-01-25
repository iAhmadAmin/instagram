import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/core/controllers/main_controller.dart';
import 'package:instagram/my_icons.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/pages/Activity/activity_page.dart';
import 'package:instagram/ui/pages/Home/home_page.dart';
import 'package:instagram/ui/pages/Profile/my_profile.dart';
import 'package:instagram/ui/pages/Profile/setting_page.dart';
import 'package:instagram/ui/pages/Search/search_page.dart';
import 'package:instagram/ui/styles/textstyles.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final MainController _controller = Get.put(MainController());
  Color textColor = Get.isDarkMode ? Colors.white : Colors.black;
  int _selectedTab = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    Container(),
    ActivityPage(),
    MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: GetBuilder<MainController>(builder: (controller) {
        final bool isMenuOpend = controller.isMenuOpened;
        return SafeArea(
          child: Stack(
            children: [
              Transform.translate(
                offset:
                    Offset(isMenuOpend ? -SizeConfig.screenWidth * 0.7 : 0, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: _pages[_selectedTab],
                    ),
                    _bottomNavBar(),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(
                    isMenuOpend
                        ? SizeConfig.screenWidth * 0.3
                        : SizeConfig.screenWidth,
                    0),
                child: _profileMenu(),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 10),
      width: SizeConfig.screenWidth,
      height: 60,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem(
            icon: _selectedTab == 0 ? MyIcons.home_active : MyIcons.home,
            index: 0,
          ),
          _buildItem(
            icon: _selectedTab == 1 ? MyIcons.search_active : MyIcons.search,
            index: 1,
          ),
          _buildItem(
            icon: MyIcons.new_post,
            index: 2,
          ),
          _buildItem(
            icon: _selectedTab == 3 ? MyIcons.heart_active : MyIcons.heart,
            index: 3,
          ),
          _profileButton(),
        ],
      ),
    );
  }

  Widget _buildItem({
    @required IconData icon,
    @required int index,
  }) {
    return GetBuilder<MainController>(builder: (controller) {
      return IconButton(
        onPressed: controller.isMenuOpened
            ? () {}
            : () {
                setState(() {
                  _selectedTab = index;
                });
              },
        icon: Icon(icon, color: Get.isDarkMode ? Colors.white : Colors.black),
      );
    });
  }

  Widget _profileButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = 4;
        });
      },
      child: CircleAvatar(
        radius: 16,
        backgroundColor: _selectedTab == 4
            ? Get.isDarkMode
                ? Colors.white
                : Colors.black
            : Get.isDarkMode
                ? Colors.black
                : Colors.white,
        child: const CircleAvatar(
          radius: 14,
          backgroundImage: AssetImage("assets/images/dp.jpg"),
        ),
      ),
    );
  }

  Widget _profileMenu() {
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: Row(
        children: [
          VerticalDivider(
            width: 0.5,
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.5)
                : Colors.black.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "i_ahmadamin",
                    style: titleTextStle,
                  ),
                ),
              ),
              Container(
                  height: 0.5,
                  width: SizeConfig.screenWidth * 0.7,
                  color: textColor.withOpacity(0.5)),
              _button(icon: MyIcons.archive, label: "Archive"),
              _button(icon: MyIcons.activity, label: "Your activity"),
              _button(icon: MyIcons.qr_code, label: "QR code"),
              _button(icon: MyIcons.bookmark, label: "Saved"),
              _button(icon: MyIcons.star, label: "Close friends"),
              _button(icon: MyIcons.add_people, label: "Discover people"),
              _button(
                  icon: Get.isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
                  label:
                      Get.isDarkMode ? "Enable lite mode" : "Enable dark mode",
                  onTap: () {
                    if (Get.isDarkMode) {
                      Get.changeThemeMode(ThemeMode.light);
                    } else {
                      Get.changeThemeMode(ThemeMode.dark);
                    }
                  }),
              const Spacer(),
              Container(
                  height: 0.5,
                  width: SizeConfig.screenWidth * 0.7,
                  color: textColor.withOpacity(0.5)),
              SizedBox(
                  height: 60,
                  child: _button(
                      icon: Icons.settings,
                      label: "Settings",
                      onTap: () {
                        Get.to(SettingPage());
                      }))
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(
      {@required String label, @required IconData icon, Function onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
