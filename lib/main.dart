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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          color: Colors.green,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.yellow,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
        ),
        Container(
          color: Colors.blue,
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
