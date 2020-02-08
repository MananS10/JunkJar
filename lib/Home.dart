import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                height: 75.0,
              ),
              Container(height: 100.0, width: 100.0,
                child: Image.asset('assets/plastic.png'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Join JunkJar',
                style: GoogleFonts.sriracha(textStyle: TextStyle(color: MyColors.white, fontSize: 50.0,)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Test Text 2',
                style: TextStyle(color: MyColors.white),
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
