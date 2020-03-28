import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkjar/models/user.dart';
import 'package:junkjar/models/user_repository.dart';
import 'package:junkjar/pages/FirstScreen.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyQRLinkPage extends StatelessWidget {
  final SharedPreferences prefs;

  MyQRLinkPage({Key key, @required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userRepository = UserRepository(prefs);
    final User _user = _userRepository.getUser();

    Future<String> _scanQrCode() async {
      String qrCode;
      try {
        qrCode = await BarcodeScanner.scan();
      } on PlatformException catch (_error) {
        if (_error.code == BarcodeScanner.CameraAccessDenied) {
          print('Camera permission denied');
        } else {
          print('Error: $_error');
        }
      }
      return qrCode;
    }

    return Scaffold(
      body: Container(
        color: MyColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome, ${_user.name}',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Scan the code shown in EldersConnect Senior',
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('Scan Code'),
                  color: MyColors.primary,
                  onPressed: () async {
                    String seniorUid = await _scanQrCode();
                    if (seniorUid != null) {
                      prefs.setBool('isConnected', true);
                      await _userRepository.updateUser(seniorUid, null);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                 FirstScreen(prefs: this.prefs)),
                              (Route<dynamic> route) => false);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}