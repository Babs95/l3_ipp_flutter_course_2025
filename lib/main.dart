import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_assets.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage("https://i.ibb.co/fYj3CHLb/pexels-stijn-dijkstra-1306815-16014493.jpg"),
      ),
    );
  }
}
