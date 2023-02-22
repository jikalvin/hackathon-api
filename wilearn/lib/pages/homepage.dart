import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:wilearn/assets/assets.dart';
import 'package:wilearn/assets/wi_widgets.dart';
import 'package:wilearn/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final _ScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopToolBar,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Some Text"),
                  background: Image.asset(
                    '../assets/images/campus-1.jpg',
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.colorBurn,
                  ),
                ),
              ),
              SliverFillRemaining(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: Courses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 270,
                                child: Card(
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                    Image.asset(
                                    "../assets/images/${all_images[index%3]}.jpg",
                                    fit: BoxFit.contain,
                                    ),
                                    const SizedBox(
                                    height: 10,
                                    ),
                                    Text(
                                        Courses[index]['name'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24.0,
                                          letterSpacing: -0.5,
                                        ),
                                    ),
                                    const Divider(thickness: 1.0, height: 20, color: Colors.black38),
                                      Text(Courses[index]['info'], maxLines: 2, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0)),
                                      const Divider(thickness: 3.0, height: 20, color: Colors.black38),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                                          },
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty.all(
                                                      const EdgeInsets.all(20))),
                                              child: const Text("Enroll Now", textScaleFactor: 1.3,),
                                            ),
                                        ),
                                      ],
                                    ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Expanded(child: Text("${Courses[index]['instructors'].map((instructor) => instructor)}", textAlign: TextAlign.right, maxLines: 2, style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic))),
                                        ],
                                      )
                                    ],
                      ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ); }
    ),
                  ],
                ),
              )),
            ],
          ),
        ),
       );
  }
}
