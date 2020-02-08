import 'package:flutter/material.dart';
import 'package:junkjar/Colours.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Test',
        style: TextStyle(color: MaterialColors.teal),
      )),

//      appBar: AppBar(
//        title: Title(
//          child: Text('YO'),
//        ),
//      ),
    );
  }
}
