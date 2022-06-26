import 'dart:convert';
import 'package:blobs/blobs.dart';
import 'package:flutter_app2/layouts/bottomnavbar.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_app2/screens/bottonnavbarstudent.dart';
import 'package:flutter_app2/screens/student_side.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_recaptcha_v2/flutter_recaptcha_v2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:g_captcha/g_captcha.dart';
import 'package:flutter_app2/layouts/app.dart';
import 'package:flutter_app2/models/student.dart';
import 'dart:async';
import 'package:flutter_app2/utilties/sql_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../size_config.dart';
import 'forget_password_screen.dart';




class Userlogin extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return login_User();
  }
}
class login_User extends State<Userlogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false ;
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  SQL_Helper helper = new SQL_Helper();
  List<Student> studentsList;
  String _username;
  String _password;
  int count = 0;
  int coun2=0;
  bool _obscureText = false;
  bool remember = false;
  int l ;
  int who;
  List<User> users = [];
  static User y;
  bool valid=false ;
  String msg='';



 //  Future<List> _login() async {
 //    final response = await http.post("http://192.168.1.38:80/ci/index.php/api/fetch_user", body: {
 //      "email":  username.text,
 //      "password": password.text,
 //    });
 //
 //    var datauser = json.decode(response.body);
 //
 //    if(datauser.length==0){
 //      AlertDialog alertDialog = AlertDialog(
 //        title: Text("Information isn't correct !!",
 //          style: TextStyle(color: Colors.white,
 //              fontWeight: FontWeight.bold,
 //              fontFamily: "Ubuntu"),),
 //        content: Text(
 //          "the Usename/Email or Password isn't correct",
 //          style: TextStyle(color: Colors.white),),
 //        backgroundColor: Color(0xffC80000),
 //      );
 //      showDialog(
 //          context: context,
 //          builder: (BuildContext context) {
 //            return alertDialog;
 //          }
 //      );
 //    }else{
 //      if(datauser[0]['type']=='student'){
 //        Navigator.push(
 //            context, MaterialPageRoute(builder: (context) {
 //          return navbar1(y,who);
 //          })
 //        );
 //      }else if(datauser[0]['level']=='teacher'){
 //        Navigator.push(
 //            context, MaterialPageRoute(builder: (context) {
 //          return Student_side();
 //        })
 //        );
 //      }
 //
 //      setState(() {
 //        username= datauser[0]['username'];
 //      });
 //
 //    }
 //
 //    return datauser;
 //  }
 //
 //  Future<List<User>> _getUsers() async {
 //
 //    var data = await http.get(
 //        'http://192.168.1.38:80/ci/index.php/api/fetch_user');
 //
 //    var jsonData = json.decode(data.body);
 //
 //
 //    int n = 0 ;
 //    int i = 0 ;
 //    for (var u in jsonData) {
 //      i++;
 //      User user = User(
 //          u["ID"],
 //          u["name"],
 //          u["email"],
 //          u["firstpassword"],
 //          u["CIN"],
 //          u["type"],
 //          u["phoneNumber"],
 //          u["classID"],
 //          u["CNE"]);
 //
 //      users.add(user);
 //    }
 //    for ( n=0;n<i;n++){
 //      print(users[n].name);
 //    }
 //    //print(users.length);
 //    l=users.length ;
 //
 //    return users;
 //  }
 //
 //  void initState() {
 //    _getUsers();
 //    super.initState();
 //  }
 //
 // Future<bool> checker (String email1,String pass ,List<User> userss) async {
 //    userss = await _getUsers();
 //    User us;
 //    bool ch=false;
 //    int c=0;
 //    for ( c=0;c<=l;c++) {
 //      if (ch == false) {
 //        us = userss[c];
 //        // print(email1);
 //        if (email1 == us.email && pass == us.firstpassword) {
 //          y = us;
 //          print(us.email);
 //          ch = true;
 //          return ch;
 //        }
 //        return ch;
 //      }
 //
 //    }
 //
 //  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    if (studentsList == null) {
      studentsList = new List<Student>();
    }

    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
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
                      coun2++;
                      _openReCaptcha();
                     debugPrint(_password);

                      if (_username=="ayoub.khadrani@usms.ac.ma"&&_password=="123456") {



                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          // if (_openReCaptcha()==true){
                          //return App(y);
                          return navbar1(1,who);
                          // }
                        }));
                        //_openReCaptcha();
                      }
                      else if (_username=="ouhda.med@gmail"&&_password=="123456") {

                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          // if (_openReCaptcha()==true){
                          //return App(y);
                          return navbar2(2,who);
                          // }
                        }));
                        //_openReCaptcha();
                      }
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

 _openReCaptcha() async {
    String tokenResult = await GCaptcha.reCaptcha(
        "6LcLP0QaAAAAAJGcV9g2BboBdEMwCvnuh68S_YUE");
    print('tokenResult: $tokenResult');
    Fluttertoast.showToast(msg: tokenResult, timeInSecForIosWeb: 4);
    // return true ;
  }
}

class HomeScreen extends State<Userlogin> {
int y ;
int who;
  TextEditingController username =new TextEditingController();
  TextEditingController password =new TextEditingController();
  String _username;
  String _password;
  String verifyResult = "";

  RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.only(top : 50, left:25,right: 25,bottom: 70 ),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column (
              children: <Widget>[
                MyImage(),
                SizedBox(height: 5),
                Center(
                  child:  Text(
                    "LOGIN",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 127, 164, 1),
                        //backgroundColor: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ubuntu"),
                  ),
                ),

                Padding (
                    padding:  EdgeInsets.only(top: 15.0,bottom : 15.0),
                    child: TextField(
                      controller: username,

                      style: TextStyle(
                          color: Color.fromRGBO(247, 148, 30, 2),
                          fontWeight: FontWeight.normal,
                          fontFamily: "Ubuntu"),
                      onChanged: (val){

                        _username = username.text;
                        debugPrint("User Edit the Username ");
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Email : " ,
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                    )
                ),
                Padding (
                    padding:  EdgeInsets.only(top: 15.0,bottom : 15.0),
                    child: TextField(
                      controller: password,
                      style: TextStyle(
                          color: Color.fromRGBO(247, 148, 30, 2),
                          fontWeight: FontWeight.normal,
                          fontFamily: "Ubuntu"),
                      onChanged: (val){
                        _password = password.text;
                        debugPrint("User Edit the Description ");
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Password : " ,
                          hintText: "Enter your password",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                    )
                ),

                // Center(
                //   child: Expanded(child: Text(
                //     " Username ",
                //     textDirection: TextDirection.ltr,
                //     style: TextStyle(
                //         color: Color.fromRGBO(247, 148, 30, 2),
                //         backgroundColor: Colors.white,
                //         fontSize: 25,
                //         fontWeight: FontWeight.normal,
                //         fontFamily: "Ubuntu"),
                //   ),
                //   ),
                // ),
                Expanded(child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text(
                    'LOGIN', textScaleFactor: 1.5,
                  ),
                  onPressed: (){
                    _username=Text(username.text).toString();
                    _password=Text(password.text).toString();
                    if (_username=="ayoub.khadrani@usms.ac.ma"&&_password=="123456") {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        // if (_openReCaptcha()==true){
                        //return App(y);
                        return navbar1(1,who);
                        // }
                      }));
                      //_openReCaptcha();
                    }
                    else if (_username=="ouhda.med@gmail"&&_password=="123456") {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        // if (_openReCaptcha()==true){
                        //return App(y);
                        return navbar2(2,who);
                        // }
                      }));
                      //_openReCaptcha();
                    }
                    else{
                      AlertDialog alertDialog= AlertDialog(
                        title: Text("Information isnt correct",),
                        content: Text("the Usename/Email or Password isnt correct"),backgroundColor: Colors.redAccent ,
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return alertDialog;
                          }
                      );
                    }
                  },
                )
                ),
                //     MyBotten(),
                // Expanded(child: Text(
                //   " Ayoub mszini d7ka ",
                //   textDirection: TextDirection.ltr,
                //   style: TextStyle(
                //       color: Colors.red,
                //       backgroundColor: Colors.lightBlue,
                //       fontSize: 30,
                //       fontFamily: "DancingScript"),
                // ),
                // ),
              ],
            )
        )

    );

  }
  _openReCaptcha() async {
    String tokenResult = await GCaptcha.reCaptcha("6LcLP0QaAAAAAJGcV9g2BboBdEMwCvnuh68S_YUE");
    print('tokenResult: $tokenResult');
    Fluttertoast.showToast(msg: tokenResult, timeInSecForIosWeb: 4);

    // setState
  }
}