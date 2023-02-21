import 'package:flutter/material.dart';

class UserCoursePage extends StatelessWidget {
  const UserCoursePage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text("You Haven't Enrolled Any Course"),
      ),
    );
  }
}