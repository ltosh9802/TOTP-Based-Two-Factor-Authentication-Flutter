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
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.pushNamed(context, 'scanQR');
        },
        child: Icon(Icons.add_box),
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

  String firsttime='';
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      
    if(userslist.isEmpty){
      firsttime="Click '+' to add users";
    }
    
    });

}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        
          Container(
            padding: EdgeInsets.all(20),
            child: Text(firsttime, style: TextStyle(fontSize: 15,color: Colors.grey[600])),
          ),
          Expanded(
              child: Scrollbar(
            child: ListView.builder(
                itemCount: userslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        "Account: ${userslist[index].accname} \nUsername:${userslist[index].username}",
                        style:
                      TextStyle(fontFamily: 'OpenSansCondensed', fontSize: 20),
                      ),
                      trailing: FlatButton(
                        child: Icon(Icons.vpn_key),
                        onPressed: () {
                          // Navigator.pushNamed(context, 'genPIN');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      generatePIN(userslist[index].key)));
                        },
                      ),
                    ),
                  );
                }),
          ))
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => generatePIN(tkey)));
            },
          ),
        ],
      ),
    );
  }
}
