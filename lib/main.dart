import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_assets.dart';
import 'package:l3_ipp_app/views/home.dart';
import 'package:l3_ipp_app/views/splash_screen.dart';

import 'common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IPP L3 GL",
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
