import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_project/screens/homePage/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? skippedIntro;
  String? loggedIn = 'false';

  gettingSkippedData() async {
    final prefs = await SharedPreferences.getInstance();
    skippedIntro = prefs.getString("skippedIntro");
    loggedIn = prefs.getString("loggedIn");
    setState(() {});
  }

  navigating() {
    if (loggedIn == "true") {
      return const HomePage();
    } else if (loggedIn == "false") {
      return const LoginPage();
    } else if (loggedIn == null) {
      return const LoginPage();
    }
  }

  @override
  void initState() {
    gettingSkippedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 600),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Friends Groceries',
          home: navigating()),
    );
  }
}
