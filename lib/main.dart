import'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/home.page.dart';
import 'package:flutter_app2/pages/users.page.dart';
import 'package:flutter_app2/screens/bottonnavbarstudent.dart';
import 'package:flutter_app2/screens/classes_screen.dart';
import 'package:flutter_app2/screens/home_screen_student.dart';
import 'package:flutter_app2/screens/login_test.dart';
import 'package:flutter_app2/screens/welcom_screen.dart';
import 'package:flutter_app2/screens/welcome_screen.dart';

import 'git_test.dart';
import 'layouts/app.dart';
import 'layouts/bottomnavbar.dart';
import 'models/user.dart';
import 'screens/forget_password_screen.dart';
import 'screens/login_screen.dart';




class MyApp extends StatelessWidget {
  User y;
  int who;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // initialRoute: "/Homepage",
      // routes: {
      //  '/':(context)=>Homepage(),
      //   '/users':(context)=>UserPage()
      // },4
     debugShowCheckedModeBanner: false,


      home:
      // bottuna(),
      // Userlogin(),
      // login_test(),
      first_page(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   // title: "Student liste ",
    //   // theme: ThemeData(
    //   //   primarySwatch: Colors.orange,
    //   // ),
    //   home:
    //   test_page(),
    // );
  }
}


  void main() {
    runApp(MyApp()

    );
  }

