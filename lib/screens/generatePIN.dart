import 'package:flutter/material.dart';
import 'package:dotp/dotp.dart';


class generatePIN extends StatefulWidget {

  final keyi;
  generatePIN(this.keyi);

  @override
  _generatePINState createState() => _generatePINState();
}


class _generatePINState extends State<generatePIN> {
  TextEditingController te;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        te =new TextEditingController();

    TOTP totp = TOTP(widget.keyi);
    print("genPIN key:"+widget.keyi);
    String gentotp=totp.now();
    print(gentotp);
    te.text = gentotp;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Generate PIN'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: TextField(
                    controller: te,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Monstserrat', fontSize: 50),
                  ),
                ),
              ),
              RaisedButton(
                  color: Color(0xff00204a),
                  textColor: Colors.white,
                  child: Text("Done"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ));
  }
}
