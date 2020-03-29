import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junkjar/models/user.dart';
import 'package:junkjar/pages/MapsPage.dart';
import 'package:junkjar/pages/QR_Link.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends StatefulWidget {
  final SharedPreferences prefs;

  FirstScreen({Key key, @required this.prefs}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User _user =
        User.fromJson(json.decode(widget.prefs.getString('user')));

    final List<Widget> _children = [
      Container(
        color: MyColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(_user.photoUrl),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Welcome, ${_user.name}', // use the same format
                    style: GoogleFonts.play(
                        textStyle: TextStyle(
                            fontSize: 22, color: MaterialColors.yellow))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: Container(
                          height: 140.0,
                          width: 140.0,
                          child: Image.asset(
                            'assets/icon-legacy.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Tile clicked');
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: Container(
                          height: 140.0,
                          width: 140.0,
                          child: Image.asset(
                            'assets/icon-legacy.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Tile clicked');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: Container(
                          height: 140.0,
                          width: 140.0,
                          child: Image.asset(
                            'assets/icon-legacy.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Tile clicked');
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5.0,
                        child: Container(
                          height: 140.0,
                          width: 140.0,
                          child: Image.asset(
                            'assets/icon-legacy.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('Tile clicked');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      MyQRLinkPage(),
      MapsPage(),
    ];

    return Scaffold(
      backgroundColor: MyColors.black,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: MyColors.accent,
        unselectedItemColor: MyColors.white,
        backgroundColor: MyColors.dark,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Scanner'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.store),
      onPressed: _launchURL,
      ),
    );
  }
}
