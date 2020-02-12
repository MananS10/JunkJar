import 'package:flutter/material.dart';
import 'package:junkjar/utils/helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JunkJar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Helper(),
    );
  }
}
