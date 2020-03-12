import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junkjar/models/user.dart';
import 'package:junkjar/pages/MapsPage.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FirstScreen extends StatefulWidget {
  final SharedPreferences prefs;

  FirstScreen({Key key, @required this.prefs}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}
int _selectedIndex = 0;
class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final User _user =
        User.fromJson(json.decode(widget.prefs.getString('user')));
    // gets logged in user back into our custom class object
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Row(
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
                  radius: 55, backgroundImage: NetworkImage(_user.photoUrl)),
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
              GestureDetector(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                  child: Container(
                    height: 125.0,
                    width: 125.0,
//                    child: Image.asset(
//                      'assets/graphics/heart.png',
//                      fit: BoxFit.fill,
//                    ),
                  ),
                ),
                //onTap: () => doNothing(),
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
                    height: 125.0,
                    width: 125.0,
//                    child: Image.asset(
//                      'assets/graphics/heart.png',
//                      fit: BoxFit.fill,
//                    ),
                  ),
                ),
                //onTap: () => doNothing(),
              ),
            ],
          ),
        ],
      ),
//    body: StaggeredGridView.countBuilder(
//      crossAxisCount: 4,
//      itemCount: 8,
//      itemBuilder: (BuildContext context, int index) => new Container(
//          color: MyColors.dark,
//          child: new Center(
//            child: new CircleAvatar(
//              backgroundColor: Colors.white,
//              child: new Text('$index'),
//            ),
//          )),
//      staggeredTileBuilder: (int index) =>
//      new StaggeredTile.count(2, index.isEven ? 2 : 1),
//      mainAxisSpacing: 4.0,
//      crossAxisSpacing: 4.0,
//    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Scanner'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Store'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.darkBlue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MapsPage();
          }));
        },
      ),
    );
  }
}
