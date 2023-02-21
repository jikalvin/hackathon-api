import 'package:flutter/material.dart';
import 'package:wilearn/assets/routes.dart';

InputDecoration buildTextFieldDecoration({required label}) => InputDecoration(
  labelText: label,
  border: const OutlineInputBorder(),
);

List<BottomNavigationBarItem> bottomBarItems(){
  return [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
        backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.menu_book_sharp),
      label: 'My Courses',
      backgroundColor: Colors.blue.shade600,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school_rounded),
      label: 'Academics',
      backgroundColor: Colors.blue.shade700,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.blue.shade800,
    ),
  ];
}
final NavigationPageRoutes = <String>[
    RouteNames.dashboard,
    RouteNames.courseList,
    RouteNames.academics,
    RouteNames.settings,
];
