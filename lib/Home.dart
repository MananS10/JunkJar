import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:junkjar/Colours.dart';
import 'package:junkjar/TestPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShadowColors.dark,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              Text(
                'Test Text',
                style: TextStyle(color: MaterialColors.yellow, fontSize: 50.0),
              ),
              Text(
                'Test Text 2',
                style: TextStyle(color: MaterialColors.yellow),
              )
            ],
          ),
        ],
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
