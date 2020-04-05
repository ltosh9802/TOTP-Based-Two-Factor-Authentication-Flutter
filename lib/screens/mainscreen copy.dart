import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screens/generatePIN.dart';
import 'package:navigation_demo_starter/users.dart';


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
  void initState() {
    // TODO: implement initState
    super.initState();

    Users dummyuser = new Users(
        "defaultname", "defaultemail", "defaultkey");
    userslist.add(dummyuser);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MainUserDetails(
              userslist[userslist.length - 1].accname,
              userslist[userslist.length - 1].username,
              userslist[userslist.length - 1].key)
        ],
      ),
    );
  }
}

class MainUserDetails extends StatelessWidget {
  String tname;
  String temail;
  String tkey;
  MainUserDetails(this.tname, this.temail, this.tkey);

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
                  "User: $tname\nEmail:$temail",
                  style:
                      TextStyle(fontFamily: 'OpenSansCondensed', fontSize: 20),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Icon(Icons.vpn_key),
            onPressed: () {
              // Navigator.pushNamed(context, 'genPIN');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => generatePIN(tkey)));
            },
          ),
        ],
      ),
    );
  }
}
