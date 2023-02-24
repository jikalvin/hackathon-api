import 'package:elearn/data/wi_widgets.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final courseID;
  int moduleCount = 0;
  CoursePage({super.key, required this.courseID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${courseID['name']}",
          overflow: TextOverflow.fade,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                //   backgroundBlendMode: BlendMode.darken,
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: AssetImage("assets/images/${courseID['image']}.jpg"),
            )),
            accountName: Text(
              courseID['name'],
              textScaleFactor: 1.3,
            ),
            accountEmail: Text(
                "${courseID['instructors'].map((instructor) => instructor)}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/${courseID['image']}.jpg"),
            ),
          ),
          ...courseID['modules']
              .map((module) => Column(
                    children: [
                      ListTile(
                        title: Text(courseID['modules'][moduleCount]['name']!),
                        leading: Text("${++moduleCount}"),
                        trailing: Icon(
                            moduleCount > 1 ? Icons.lock : Icons.lock_open),
                        onTap: () {},
                      ),
                      const Divider(
                        height: 4,
                        thickness: 2,
                      ),
                    ],
                  ))
              .toList()
        ],
      )),
      body: ModuleView(moduleID: courseID['modules'][0]['name'], moduleIndex: 0,)
    );
  }
}