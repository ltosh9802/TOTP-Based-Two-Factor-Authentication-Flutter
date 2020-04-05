import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auth++',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'scanQR');
        },
        child: Icon(Icons.camera),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MainUserDetails(),
          MainUserDetails(),
          MainUserDetails(),
          MainUserDetails(),
        ],
      ),
    );
  }
}

class MainUserDetails extends StatelessWidget {
  const MainUserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "User: Toshik Langade\nEmail:toshiklangade@gmail.com",
                  style:
                      TextStyle(fontFamily: 'OpenSansCondensed', fontSize: 20),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Icon(Icons.vpn_key),
            onPressed: (){
                        Navigator.pushNamed(context, 'genPIN');

            },
          ),
        ],
      ),
    );
  }
}
