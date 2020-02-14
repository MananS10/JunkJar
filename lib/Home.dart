import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:junkjar/Colours.dart';
import 'package:junkjar/GoogleButton.dart';
import 'package:junkjar/TestPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:junkjar/sign_in.dart';

import 'FirstScreen.dart';

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
              Container(
                height: 175.0, width: 175.0,
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
                onLongPress: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstScreen();
                        },
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FirstScreen();
          }));
        },
      ),
    );
  }
}
