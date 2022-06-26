import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/layouts/bottomnavbar.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'dart:convert';

import 'package:school_ui_toolkit/school_ui_toolkit.dart';

import 'bottonnavbarstudent.dart';
import 'forget_password_screen.dart';



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

// ignore: camel_case_types
class login_test extends StatefulWidget {
  //MyHomePage({Key key, this.title ,this.name}) : super(key: key);


  login_test();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<login_test> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String _username;
  String _password;
  User y;
  int who;
  bool _obscureText = false;
  bool remember = false;
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
  List<User> users= [];
  Future<List<User>> _getUsers() async {
    String data = await rootBundle.loadString('assets/user.json');
    var jsonData = json.decode(data);


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

  //  print("the count is " + users.length.toString());

    return users;
  }
  User us;
  bool ch=false;
  Future<bool> checker (String email1,String pass ,List<User> userss) async {
    userss = await _getUsers();
    int l = userss.length;

    int c=0;
    for ( c=0;c<=l;c++) {
      if (ch == false) {
        us = userss[c];
        // print(email1);
        if (email1 == us.email && pass == us.firstpassword) {
          y = us;
          print(us.email);
          ch = true;
          print (ch);
          return ch;
        }
        print (ch);
        return ch;
      }
      print (ch);

    }
    print (ch);
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    // if (studentsList == null) {
    //   studentsList = new List<Student>();
    // }

    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return Scaffold(

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
                Scaffold(

                  // appBar: AppBar(
                  //   title: Text("LOGIN PAGE "),
                  // ),
                    body:
                    Container(

                      //     decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      //
                      //     image: AssetImage(
                      //     "images/main_top.png"
                      //     ),
                      //
                      // fit: BoxFit.cover,
                      // ),
                      // ),
                        child : Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                          child:
                          ListView(
                            children: <Widget>[



                              MyImage(),
                              Center(
                                child: Text(
                                  " LOGIN ",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 127, 164, 1),
                                      //  backgroundColor: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu"),
                                ),
                              ),


                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, bottom: 5.0, left: 10, right: 10),
                                  child: TextField(
                                    controller: username,
                                    style: textStyle,

                                    onChanged: (val) {
                                      _username = username.text;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person),
                                        labelText: "E-mail : ",
                                        hintText: "Enter your email",
                                        labelStyle: new TextStyle(color: Color(0xff8f8ea0)),
                                        fillColor: Color(0xffe7e6e7),
                                        filled: true,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        )
                                    ),
                                  )
                              ),
                              Padding(

                                padding: EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 10, right: 10),

                                child: TextFormField(

                                  controller: password,
                                  style: textStyle,

                                  onChanged: (val) {
                                    _password = password.text;
                                  },

                                  decoration: InputDecoration(

                                      prefixIcon: Icon(Icons.vpn_key),
                                      labelText: "Password : ",
                                      labelStyle: new TextStyle(color: Color(0xff8f8ea0)),
                                      fillColor: Color(0xffe7e6e7),
                                      filled: true,


                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: this._obscureText ? Colors.blue : Colors
                                              .grey,
                                        ),
                                        onPressed: () {
                                          setState(() =>
                                          this._obscureText = !this._obscureText);
                                        },
                                      ),
                                      border: OutlineInputBorder(

                                        borderRadius: BorderRadius.circular(10.0),
                                      )
                                  ),
                                  validator: (val) =>
                                  val.length < 6
                                      ? 'Password too short.'
                                      : null,
                                  onSaved: (val) => _password = val,
                                  obscureText: !this._obscureText,

                                ),


                              ),
                              // Container(height: 10.0,),
                              Container(
                                child: RaisedButton(
                                  // onPressed:() {
                                  // _login();
                                  // },
                                  onPressed: () {
                                    //coun2++;
                                   // _openReCaptcha();
                                    debugPrint(_password);
                                    // int c=0;
                                    // for ( c=0;c<=users.length;c++) {
                                    //   if (ch == false) {
                                    //     us = users[c];
                                    //     // print(email1);
                                    //     if (_username == us.email && _password == us.firstpassword) {
                                    //       y = us;
                                    //       print(us.email);
                                    //       ch = true;
                                    //       print (ch);
                                    //       return ch;
                                    //     }
                                    //     print (ch);
                                    //     return ch;
                                    //   }
                                    //   print (ch);
                                    //
                                    // }

                                      if(_username == "ayoub.khadrani@usms.ac.ma" && _password == "123456"){

                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) {
                                        // if (_openReCaptcha()==true){
                                        //return App(y);
                                        return navbar1(1,who);
                                        // }
                                      }));}
                                      else if(_username == "ouhda.med@gmail.com" && _password == "123456") {

                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) {
                                          // if (_openReCaptcha()==true){
                                          //return App(y);
                                          return navbar2(2,who);
                                          // }
                                        }));
                                        //_openReCaptcha();
                                      }
                                      //_openReCaptcha();


                                    // checker(_username ,_password , users);

                                    // ignore: unrelated_type_equality_checks
                                    // if (username == "ayoub.khadrani@usms.ac.ma" && password == "123456" ){
                                    //   who=1;
                                    //   Navigator.push(
                                    //       context, MaterialPageRoute(builder: (context) {
                                    //     // if (_openReCaptcha()==true){
                                    //     //return App(y);
                                    //     return navbar2(y,who);
                                    //     // }
                                    //   }));
                                    // }
                                    // // ignore: unrelated_type_equality_checks
                                    // else if (username == "ouhda.med@gmail.com" && password == "123456" ){
                                    //   who=2;
                                    //   Navigator.push(
                                    //       context, MaterialPageRoute(builder: (context) {
                                    //     // if (_openReCaptcha()==true){
                                    //     //return App(y);
                                    //     return navbar1(y,who);
                                    //     // }
                                    //   }));
                                    // }
                                    // if (checker(_username ,_password , users)==true) {
                                    //   // if(y.type=="teacher") {
                                    //     Navigator.push(
                                    //         context, MaterialPageRoute(builder: (context) {
                                    //       // if (_openReCaptcha()==true){
                                    //       //return App(y);
                                    //       return navbar(y);
                                    //       // }
                                    //     }));
                                    // }
                                    // else if (y.type=="student"){
                                    //   Navigator.push(
                                    //       context, MaterialPageRoute(builder: (context) {
                                    // if (_openReCaptcha()==true){
                                    // return Student_side();
                                    // }
                                    // }));
                                    // }
                                    // }
                                    else {

                                      AlertDialog alertDialog = AlertDialog(
                                        title: Text("Information isn't correct !!",
                                          style: TextStyle(color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Ubuntu"),),
                                        content: Text(
                                          "the Usename/Email or Password isn't correct",
                                          style: TextStyle(color: Colors.white),),
                                        backgroundColor: Color(0xffC80000),
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertDialog;
                                          }
                                      );
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: Color.fromRGBO(247, 148, 30, 1),
                                  child: Text(
                                    "LOGIN",

                                    style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 10, right: 10),
                                width: 120,
                                height: 40,


                              ),
                              Container(
                                margin:EdgeInsets.only(
                                    right: 10),
                                child:  Row(

                                    children:[
                                      Checkbox(
                                        value: remember,
                                        activeColor: Color.fromRGBO(0, 127, 164, 1),
                                        onChanged: (value) {
                                          setState(() {
                                            remember = value;
                                          });
                                        },
                                      ),
                                      Text("Remember me" , style: TextStyle( color : Color.fromRGBO(0, 127, 164, 1),fontFamily: "Ubuntu")),
                                      Spacer(),
                                      GestureDetector(


                                          child: Text(
                                              "Forget Password ?",
                                              style: TextStyle(
                                                fontFamily: "Ubuntu",
                                                //  decoration: TextDecoration.underline,
                                                color: Color.fromRGBO(0, 127, 164, 1),
                                              )
                                          ),

                                          onTap: () {
                                            // do what you need to do when "Click here" gets clicked
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) {
                                              return forget_password();
                                            }
                                            )
                                            );
                                          }
                                      )
                                    ]
                                ),
                              )



                            ],
                          ),
                        )

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
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('images/Login_logo.png');
    Image myImg =new Image(image: image, width: 300,height: 200,);
    return Container(child: myImg,
      margin: EdgeInsets.only(left:30, top: 25 , right: 30,),);
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