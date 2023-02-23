import 'package:flutter/material.dart';

import '../data/data.dart';
import '../data/wi_widgets.dart';

class AcademicsPage extends StatelessWidget {
  const AcademicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopToolBar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
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
                            children: const [
                              SizedBox(
                                width: 270,
                                height: 270,
                                child: Text("Hi THERR"),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
