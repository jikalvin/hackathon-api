import 'dart:math';

import 'package:elearn/data/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

import '../pages/academics.dart';
import '../pages/course_list.dart';
import '../pages/course_page.dart';
import '../pages/homepage.dart';
import '../pages/settings.dart';
import 'data.dart';

InputDecoration buildTextFieldDecoration({required label}) => InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

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

class CourseList extends StatefulWidget {
  final searchFilter;

  const CourseList({super.key, this.searchFilter = ''});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  showCourseDialog(BuildContext context, courseID) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/${courseID['image']}.jpg",
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        courseID['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Divider(
                          thickness: 1.0, height: 20, color: Colors.black38),
                      Text(courseID['info'],
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16.0)),
                      const Divider(
                          thickness: 3.0, height: 20, color: Colors.black38),
                      const SizedBox(height: 400, child: Text("Other Info")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Text(
                                  "Your Instructor(s): ${courseID['instructors'].map((instructor) => instructor)}",
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20))),
                              child: const Text(
                                "Cancel",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CoursePage(courseID: courseID)));
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20))),
                              child: const Text(
                                "Start",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 70),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: Courses.length,
                itemBuilder: (context, index) {
                  double progress = (Random().nextDouble() * 100);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    constraints: const BoxConstraints(
                                      minHeight: 120,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(.6),
                                              BlendMode.multiply),
                                          image: AssetImage(
                                            "assets/images/${all_images[index % 3]}.jpg",
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              Courses[index]['name'],
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24.0,
                                                letterSpacing: -0.5,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(Courses[index]['info'],
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14.0,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        Courses[index]['isLearning']
                                            ? CircularProgressIndicator(
                                                value: progress / 100,
                                                backgroundColor: Colors.white,
                                                strokeWidth: 8,
                                                semanticsLabel: "%",
                                                semanticsValue: "$progress",
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Courses[index]['isLearning']
                                                ? OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CoursePage(
                                                                      courseID:
                                                                          Courses[
                                                                              index])));
                                                    },
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty.all(
                                                                const EdgeInsets
                                                                    .all(10))),
                                                    child: const Text(
                                                      "Continue Learning",
                                                      textScaleFactor: 1.3,
                                                    ),
                                                  )
                                                : OutlinedButton(
                                                    onPressed: () {
                                                      showCourseDialog(context,
                                                          Courses[index]);
                                                    },
                                                    style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty.all(
                                                                const EdgeInsets
                                                                    .all(20))),
                                                    child: const Text(
                                                      "Start Learning",
                                                      textScaleFactor: 1.3,
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  "${Courses[index]['instructors'].map((instructor) => instructor)}",
                                                  textAlign: TextAlign.right,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontStyle:
                                                          FontStyle.italic))),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }
}

class ModuleView extends StatefulWidget {
  const ModuleView(
      {super.key, required this.moduleID, required this.moduleIndex});
  final int moduleIndex;
  final String moduleID;
  @override
  State<ModuleView> createState() => _ModuleViewState();
}

class _ModuleViewState extends State<ModuleView> {
  late VideoPlayerController _videoController;
  // late PdfDocument modulePDF;
  PDFDoc? modulePDF;
  String pdfText = '';
  String pdfLink =
      "https://github.com/MLesky/School-Work/blob/year2-semester1-work/CLIENT%20WEB%20DEVELOPMENT/Questions/activity4javascript.pdf";
  String videoLink =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(videoLink)
      ..initialize().then((_) {
        setState(() {});
      });

    fetchPdf();
    // modulePDF = PdfDocument(inputBytes: File.fromUri(Uri(path: pdfLink)).readAsBytesSync());
    // pdfText = PdfTextExtractor(modulePDF).extractText();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Text(widget.moduleID,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  _videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                VideoPlayer(_videoController),
                                VideoProgressIndicator(_videoController,
                                    allowScrubbing: true)
                              ]),
                        )
                      : Container(
                          width: 300,
                          height: 175,
                          color: Colors.black.withOpacity(.7),
                        ),
                  _videoController.value.isBuffering &&
                          _videoController.value.isPlaying
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.black.withOpacity(.7),
                        )
                      : Container(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _videoController.value.isPlaying
                          ? _videoController.pause()
                          : _videoController.play();
                    });
                  },
                  icon: Icon(
                    _videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 3, color: Colors.black38),
            modulePDF == null ? const LinearProgressIndicator() : Text(pdfText),
            Row(
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      if (widget.moduleIndex > 0) {
                        ModuleView(moduleID: "id", moduleIndex:  widget.moduleIndex+1);
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    label: Text("Back")),
                widget.moduleIndex < Courses.length ? ElevatedButton.icon(
                    onPressed: () {
                        ModuleView(moduleID: "id", moduleIndex:  widget.moduleIndex-1);
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    label: Text("Back")) : ElevatedButton.icon(
                    onPressed: () {
                      ModuleView(moduleID: "id", moduleIndex:  widget.moduleIndex-1);
                    },
                    icon: Icon(Icons.done),
                    label: Text("Finish"))
              ],
            )
          ]),
        ),
      ],
    );
  }

  Future fetchPdf() async {
    final fetchResult = await PDFDoc.fromURL(pdfLink);
    setState(() {
      modulePDF = fetchResult;
      pdfText = modulePDF!.text as String;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
    // modulePDF.dispose();
  }
}

PreferredSizeWidget TopToolBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    toolbarOpacity: 1,
    bottomOpacity: 0,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/logo.png'),
    ),
    title: const Text(
      "E-learn",
    ),
    actions: [
      IconButton(
        onPressed: () {
          GoRouter.of(context).goNamed(RouteNames.signin);
        },
        icon: const Icon(
          Icons.search,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
      IconButton(
        onPressed: () {
          context.goNamed(RouteNames.signin);
        },
        icon: const Icon(
          Icons.account_circle,
        ),
      ),
    ],
  );
}
