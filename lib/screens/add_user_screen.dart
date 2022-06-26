import 'package:flutter/material.dart';
import 'package:flutter_app2/models/student.dart';
import 'package:flutter_app2/utilties/databse.dart';


class add_User extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return add();
  }

}
class add extends State<add_User>{
  @override
  // bool _obscureText = false;
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }
  TextEditingController username =new TextEditingController();
  TextEditingController password =new TextEditingController();
  TextEditingController email =new TextEditingController();
  String _username;
  String _password;
  String _email;


  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD USER"),
      ),
      body : ListView(
        children: <Widget>[
          Container(height:  50,),
          Center(
            child:  Text(
              " ADD USER ",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Color.fromRGBO(0, 127, 164, 1),
                  //  backgroundColor: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu"),
            ),
          ),


          Padding (
              padding:  EdgeInsets.only(top: 15.0,bottom : 5.0,left: 10,right: 10),
              child: TextField(
                controller: username,
                style: textStyle,

                onChanged: (val){
                  _username = username.text;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Usernam : " ,
                    labelStyle:new TextStyle(color: Color(0xff8f8ea0)),
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
          Padding (
            padding:  EdgeInsets.only(top: 15.0,bottom : 15.0,left: 10,right: 10),
            child: TextFormField(


              controller: email,

              style: textStyle,

              onChanged: (val){
                _email=email.text;
              },
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.email),
                  labelText: "Email : ",
                  labelStyle:new TextStyle(color: Color(0xff8f8ea0)),
                  fillColor: Color(0xffe7e6e7),
                  filled: true,

                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
              // validator: (val) => val.length < 6 ? 'Password too short.' : null,
              // onSaved: (val) => _password = val,
              // obscureText:!this._obscureText,
            ),




          ) ,
          Padding (
            padding:  EdgeInsets.only(top: 15.0,bottom : 15.0,left: 10,right: 10),
            child: TextFormField(
              controller: password,
              style: textStyle,
              onChanged: (val){
                _password=password.text;
              },
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: "Password : ",
                  labelStyle:new TextStyle(color: Color(0xff8f8ea0)),
                  fillColor: Color(0xffe7e6e7),
                  filled: true,

                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
              // validator: (val) => val.length < 6 ? 'Password too short.' : null,
              // onSaved: (val) => _password = val,
              // obscureText:!this._obscureText,
            ),




          ) ,
          // Container(height: 10.0,),
          Container(
            child : RaisedButton(
              onPressed: () {

                    var newDBUser= Student(_username,_email,_password);
                    DBProvider.db.newUser(newDBUser);
                // debugPrint(_password);
                // if ((_username == "student" && _password == "student" ) ||
                //     (_username == "teacher"&& _password == "teacher")) { Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return App();
                // }));
                // }
                // else {
                //   AlertDialog alertDialog = AlertDialog(
                //     title: Text("Information isn't correct !!", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),),
                //     content: Text("the Usename/Email or Password isn't correct", style: TextStyle(color: Colors.white),),
                //     backgroundColor: Color(0xffC80000),
                //   );
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return alertDialog;
                //       }
                //   );
                // }
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: Color.fromRGBO(247, 148, 30, 1),
              child : Text(
                "ADD",

                style : TextStyle(
                  fontFamily: "Ubuntu",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            margin: EdgeInsets.only(top: 15.0,bottom : 15.0,left: 10,right: 10),
            width: 150,
            height: 50,



          ),
          Container(
              margin: EdgeInsets.only(bottom : 15.0,left: 20,right: 10),
              child:GestureDetector(

                  child: Text(
                      "Forget Password ?",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 20,
                        //  decoration: TextDecoration.underline,
                        color: Color.fromRGBO(0, 127, 164, 1),
                      )
                  ),

                  onTap: () {
                    // // do what you need to do when "Click here" gets clicked
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return forget_password();
                    // }
                    // )
                    // );
                  }
              )

          )



        ],
      ),
    );
  }

}