import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:wilearn/assets/routes.dart';

import '../pages/academics.dart';
import '../pages/course_list.dart';
import '../pages/homepage.dart';
import '../pages/settings.dart';
import 'assets.dart';

InputDecoration buildTextFieldDecoration({required label}) => InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu_book_sharp),
        title: 'My Courses',
        inactiveIcon: const Icon(Icons.menu_book),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.school_rounded),
        title: 'Academics',
        inactiveIcon: const Icon(Icons.school_outlined),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        inactiveIcon: const Icon(Icons.settings_outlined),
        activeColorPrimary: Colors.yellow,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const UserCoursePage(),
      const AcademicsPage(),
      const SettingsPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.blue, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
      true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(100.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

final TopToolBar = AppBar(
      elevation: 0.0,
      toolbarOpacity: 1,
      bottomOpacity: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(ImageAssets.logo),
      ),
      title: const Text(
        "Wilearn",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
          ),
        ),
      ],
    );
