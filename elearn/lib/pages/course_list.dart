import 'package:flutter/material.dart';

import '../data/wi_widgets.dart';

class UserCoursePage extends StatefulWidget {
  const UserCoursePage({super.key});

  @override
  State<UserCoursePage> createState() => _UserCoursePageState();
}

class _UserCoursePageState extends State<UserCoursePage> {
  final title = 'E-learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopToolBar(context),
      body: const CourseList(/* users courses */),
    );
  }
}
