import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/icons/my_icons.dart';
import 'package:instagram/ui/pages/Activity/activity_page.dart';
import 'package:instagram/ui/pages/Home/home_page.dart';
import 'package:instagram/ui/pages/Profile/profile_page.dart';
import 'package:instagram/ui/styles/colors.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedTab = 0;

  final List<Widget> _pages = [
    HomePage(),
    Container(),
    Container(),
    ActivityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Expanded(
              child: _pages[_selectedTab],
            ),
            _bottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 10),
      width: SizeConfig.screenWidth,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Instagram",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(32),
                    fontWeight: FontWeight.w600,
                    color: textColor)),
          ),
          IconButton(
            icon: Icon(
              MyIcons.messenger,
              color: textColor,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 10),
      width: SizeConfig.screenWidth,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
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
    return IconButton(
      onPressed: () {
        setState(() {
          _selectedTab = index;
        });
      },
      icon: Icon(icon, color: textColor),
    );
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
        backgroundColor: _selectedTab == 4 ? textColor : backgroundColor,
        child: CircleAvatar(radius: 14, backgroundColor: Colors.grey),
      ),
    );
  }
}
