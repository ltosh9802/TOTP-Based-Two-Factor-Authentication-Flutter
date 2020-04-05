import 'package:flutter/material.dart';
import 'screens/enterdetails.dart';
import 'screens/generatePIN.dart';
import 'screens/mainscreen.dart';
import 'screens/scanQR.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff00204a),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => mainScreen(),
        'scanQR': (context) => scanQR(),
      },
    );
  }
}
