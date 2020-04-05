import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screens/enterdetails.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:dotp/dotp.dart';

class scanQR extends StatefulWidget {
  @override
  _scanQRState createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
  TextEditingController outputController;

  String newUserKey;
  Future qrscanning() async {
    setState(() async {
      newUserKey = await scanner.scan();

      TOTP totp = TOTP(newUserKey);
      String gentotp = totp.now();
      print(gentotp);
      outputController.text = gentotp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScanQR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Scan the QR code", style: TextStyle(fontSize: 20),),
            ),
            FlatButton(
              onPressed: qrscanning,
              child: Icon(Icons.camera_enhance, size: 150,),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                maxLength: 6,
                controller: this.outputController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "OTP",
                  disabledBorder: InputBorder.none,
                  enabled: false,
                  // hintText: 'The barcode or qrcode you scan will be displayed in this area.',
                  hintStyle: TextStyle(fontSize: 15),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                ),
              ),
            ),
            RaisedButton(
              
              onPressed: () {
                // Navigator.popAndPushNamed(context, 'enterD');
                if(this.outputController.text != ''){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => enterDetails(newUserKey)));
                }
              },
              
              child: Text(
                "Enter Details",
                style: TextStyle(color: Colors.white),
              ),
              disabledColor: Colors.blueGrey,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
