import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:junkjar/TestPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          child: Text('Hello'),
          color: Colors.blue,
        ),
      ),
      body: Center(
        child: GradientText(
          'My Gradient Text',
          gradient: Gradients.blush,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TestPage();
          }));
        },
      ),
    );
  }
}
