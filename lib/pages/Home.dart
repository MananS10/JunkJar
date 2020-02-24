import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junkjar/models/user.dart';
import 'package:junkjar/services/auth_service.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:junkjar/utils/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'FirstScreen.dart';
import 'GoogleButton.dart';

class MyHomePage extends StatefulWidget {
  final SharedPreferences prefs;
  AuthService authService = AuthService();

  MyHomePage({Key key, @required this.prefs}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                height: 75.0,
              ),
              Container(
                height: 175.0,
                width: 175.0,
                child: FlareActor("assets/recycle.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "enter"),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Join JunkJar',
                style: GoogleFonts.sriracha(
                    textStyle: TextStyle(
                  color: MyColors.white,
                  fontSize: 50.0,
                )),
              ),
              Text(
                'Join JunkJar to convert your plastic bottles into \n points to claim exciting gift cards and vouchers!',
                style: GoogleFonts.sriracha(
                    textStyle: TextStyle(
                  color: MyColors.white,
                  fontSize: 15.0,
                )),
              ),
              SizedBox(
                height: 80.0,
              ),
//              SignInButton(Buttons.Google, onPressed: (){
//                signInWithGoogle().whenComplete(() {
//                  Navigator.of(context).push(
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return FirstScreen();
//                      },
//                    ),
//                  );
//                });
//              },),
              GestureDetector(
                child: GoogleButton(),
                onLongPress: () async {
                  //create a firebase user and get all the details
                  FirebaseUser _firebaseUser =
                      await widget.authService.signInWithGoogle();

                  final String uuid = Uuid().v4(); // generates random ID
                  final String name = _firebaseUser.displayName;
                  final String email = _firebaseUser.email;
                  final String photoUrl = _firebaseUser.photoUrl;

                  if (_firebaseUser != null) {
                    print('Login success! $name, $email');

                    User user = User(
                      uuid: uuid,
                      name: name,
                      email: email,
                      photoUrl: photoUrl,
                    ); // this is our own custom class so it's easy later

                    widget.prefs.setBool('isFirstLaunch', false);
                    // won't open the login page again

                    widget.prefs.setString('user', json.encode(user));
                    // shared preferences saves data locally to the phone

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FirstScreen(prefs: this.widget.prefs)),
                        (Route<dynamic> route) => false);
                  } else {
                    print('Not logged in');
                  }
                },
              ),
            ],
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.remove),
//        onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return FirstScreen(prefs: this.widget.prefs);
//          }));
//        },
//      ),
    );
  }
}
