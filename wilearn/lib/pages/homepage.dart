import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:wilearn/assets/assets.dart';
import 'package:wilearn/assets/wi_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final _ScrollController = ScrollController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        toolbarOpacity: 1,
        bottomOpacity: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImageAssets.logo),
        ),
        title: const Text("Wilearn",),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),

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
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    color: Colors.green,
                    width: 270,
                    height: 200,
                    child: Card(
                      elevation: 7.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              '../assets/images/classroom.jpg',
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "Biology Practicals",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Divider(height: 12, thickness: 2,),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: OutlinedButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0)),
                                        ),
                                        child: const Text(
                                          "Enroll Now",
                                          textScaleFactor: 1.2,
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),

      bottomNavigationBar: Hidable(
        controller: _ScrollController,
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i){
            setState(() => _index = i);
            context.pushReplacementNamed(NavigationPageRoutes[_index]);
          },
          items: bottomBarItems(),
          selectedItemColor: Colors.yellow,
        ),
      )
    );
}


























}