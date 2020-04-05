import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/users.dart';

class enterDetails extends StatefulWidget {
  String newUserkey;
  enterDetails(this.newUserkey);

  @override
  _enterDetailsState createState() => _enterDetailsState();
}

class _enterDetailsState extends State<enterDetails> {
  Users newUser;
  String newAccname;
  String newUsername;
  String newUserpass;
  String newuserkey1 = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newuserkey1 = widget.newUserkey;
    print('in enterDetails' + newuserkey1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Account Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Enter account name and username",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          newAccname = value;
                        },
                        style: TextStyle(fontSize: 21),
                        decoration: InputDecoration(
                          fillColor: Colors.purple,
                          icon: Icon(Icons.account_balance),
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          newUsername = value;
                        },
                        style: TextStyle(fontSize: 21),
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          icon: Icon(Icons.account_circle),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: RaisedButton(
                        color: Color(0xff00204a),
                        textColor: Colors.white,
                        child: Text("Done"),
                        onPressed: () {
                          newUser = new Users(newAccname.toString(),
                              newUsername.toString(), newuserkey1);
                          userslist.add(newUser);

                          for (var i = 0; i < userslist.length; i++) {
                            print(userslist[i].accname +
                                " " +
                                userslist[i].username);
                          }
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
