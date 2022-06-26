import'package:flutter/material.dart';
import 'package:flutter_app2/pages/home.page.dart';
// import 'package:flutter_app2/pages/home.page.dart';

class test_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange ,
      ),
      routes: {
       // "/":(context)=>Homepage(),
       // "/users":(context)=>UserPage()
      },
     // initialRoute: "/users",

      home: Homepage(),
    );
  }

}
