import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:elearn/data/data.dart';
import 'package:elearn/data/wi_widgets.dart';
import 'package:elearn/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopToolBar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Some Text"),
                background: Image.asset(
                  'assets/images/campus-1.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.colorBurn,
                ),
              ),
            ),
            const SliverFillRemaining(child: CourseList()),
          ],
        ),
      ),
    );
  }
}
