import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'dart:convert';

import 'package:school_ui_toolkit/school_ui_toolkit.dart';



// class list extends StatelessWidget {
//   String name ;
//   list(this.name);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: name+"'s Students",name: name,),
//     );
//   }
// }

class list extends StatefulWidget {
  //MyHomePage({Key key, this.title ,this.name}) : super(key: key);

  String name;
  list(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<list> {

  int k;
  void setK(name){
    print (name);
    if (name=="ASR-S1") {
      k = 0;
    }
    else if (name=="ASR-S2"){k=2;}
   else if(name=="ASR-S3"){k=3;}
   else if (name=="ASR-S4"){k=4;}
   else if (name=="GE-S1"){k=5;}

  }
  Future<List<User>> _getUsers() async {
    String data = await rootBundle.loadString('assets/student.json');
    var jsonData = json.decode(data);

    List<User> users= [];
    for(var u in jsonData) {

      User user = User( u["ID"],
          u["name"],
          u["email"],
          u["firstpassword"],
          u["CIN"],
          u["type"],
          u["phoneNumber"],
          u["classID"],
          u["CNE"]);
      // ignore: unrelated_type_equality_checks

        users.add(user);

    }

    print("the count is " + users.length.toString());

    return users;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.name),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
            if(asyncSnapshot.data == null){
              return Container(
                child: Center(
                  child: LoadingFlipping.circle(
                    borderColor: Colors.cyan,
                    borderSize: 3.0,
                    size: 90.0,
                    backgroundColor: Colors.deepOrange,
                    duration: Duration(milliseconds: 600),
                  ),
                ),
              );
            } else {
              return
                Padding(
                  padding: EdgeInsets.all(
                  ScreenUtil().setWidth(12.0),
            ),
                child : ListView.builder(
                itemCount: asyncSnapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap:  (){

                    },
                   child : ProfileCard(

                      imageURL:
                      'https://cdn1.iconfinder.com/data/icons/female-avatars-vol-1/256/female-portrait-avatar-profile-woman-sexy-afro-2-512.png',
                      email: asyncSnapshot.data[index].email,
                      name: asyncSnapshot.data[index].name,
                      phoneNumber: '0'+asyncSnapshot.data[index].phoneNumber,
                      post: 'student',
                      margin: EdgeInsets.all(5.0),
                    )
                  );
                  //   ListTile(
                  //   title: Text(asyncSnapshot.data[index].name),
                  //   leading: CircleAvatar(
                  //       backgroundImage: AssetImage(
                  //           "assets/default.jpg"
                  //       )
                  //   ),
                  //   subtitle: Text(asyncSnapshot.data[index].email) ,
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         new MaterialPageRoute(builder: (context) => DetailPage(asyncSnapshot.data[index]))
                  //     );
                  //   },
                  // );
                },
              )
                );
            }
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





class DetailPage extends StatelessWidget {

  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        child: Center(
          child: Text(this.user.email),
        ),
      ),
    );
  }
}
class ScreenSize {
  static const double width = 500.0;
  static const double height = 900.0;
}