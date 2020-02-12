import 'package:flutter/material.dart';
import 'package:junkjar/utils/Colours.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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

            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: MyColors.darkBlue,),
            title: new Text('Home',style: TextStyle(color: MyColors.darkBlue),),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail, color: MyColors.darkBlue,),
            title: new Text('Messages',style: TextStyle(color: MyColors.darkBlue),),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: MyColors.darkBlue,),
              title: Text('Profile', style: TextStyle(color: MyColors.darkBlue),)
          ),
        ],
      ),
    );
  }
}
