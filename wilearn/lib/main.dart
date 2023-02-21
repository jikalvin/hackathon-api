import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wilearn/authenticate/signin.dart';
import 'package:wilearn/authenticate/signup.dart';
import 'package:wilearn/pages/academics.dart';
import 'package:wilearn/pages/course_list.dart';
import 'package:wilearn/pages/homepage.dart';
import 'package:wilearn/pages/settings.dart';

import 'assets/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wilearn',
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(name: RouteNames.signin, path: "/signin", builder: (context, state) => const SignInPage()),
        GoRoute(name: RouteNames.signup, path: "/signup", builder: (context, state) => const SignUpMode(),
          routes: [
            GoRoute(path: 'info', builder: (context, state) => const SignUpInfo()),
            GoRoute(path: 'credentials', builder: (context, state) => const SignUpCredentials()),
          ]
        ),
        GoRoute(name: RouteNames.dashboard, path: "/", builder: (context, state) => const HomePage()),
        GoRoute(name: RouteNames.courseList, path: '/courses', builder: (context, state) => const UserCoursePage()),
        GoRoute(name: RouteNames.academics, path: '/academics', builder: (context, state) => const AcademicsPage()),
        GoRoute(name: RouteNames.settings, path: '/settings', builder: (context, state) => const SettingsPage()),
      ]);
}