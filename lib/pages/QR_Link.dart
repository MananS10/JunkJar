import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkjar/utils/Colours.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyQRLinkPage extends StatelessWidget {
  final SharedPreferences prefs;

  MyQRLinkPage({Key key, @required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final User _user = User.fromJson(json.decode(prefs.getString('user')));

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
        color: MyColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Scan a QR code',
                ),
                Text(
                  'Value will be printed in console',
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  child: Text('Scan Code'),
                  color: MyColors.accent,
                  onPressed: () async {
                    String qrDecoded = await _scanQrCode();
                    print('QR code value is: $qrDecoded');
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
