import 'dart:async';

 import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/login_screen.dart';
import 'package:flutter_app2/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_test.dart';



class first_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return  login_test();
          }));
    } else {
      await prefs.setBool('seen', true);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return Home_screen();
          }));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  //return null ;
  }
}
