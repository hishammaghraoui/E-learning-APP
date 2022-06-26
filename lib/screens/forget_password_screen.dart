

import 'package:flutter/material.dart';
import 'login_screen.dart';


class forget_password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return forget();
  }

}
class forget extends State<forget_password>{
  @override
  TextEditingController recovery_email =new TextEditingController();

  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    RaisedButton button =RaisedButton(
      onPressed: () {
        //onClick(context);

      },
      color: Color.fromRGBO(247, 148, 30, 1),
      child : Text(
        "SUMBIT",
        style : TextStyle(
          fontFamily: "Ubuntu",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
    return WillPopScope( onWillPop:(){goBack();}
      ,child :Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0 , right: 15.0),
        child: ListView(
          children:<Widget>[
            Container(
                margin: EdgeInsets.only(top: 15.0,bottom : 15.0,left: 10,right: 300),
                height: 50,
                width: 50,
                child: RaisedButton(
                  onPressed: () {
                    //navigateToLogin();
                    //onClick(context);
                    goBack();
                  },
                  color: Color.fromRGBO(247, 148, 30, 1),
                  shape: CircleBorder(side: BorderSide.none),
                  child: Center(child :Icon(Icons.arrow_back, color: Colors.white,),),
                )
            ),

            MyImage(),
            Center(
             child: Text(
                "RECOVER PASSWORD",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromRGBO(0, 127, 164, 1),
                    //  backgroundColor: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Ubuntu"),
              ),
              ),

            Padding (
                padding:  EdgeInsets.only(top: 20.0,bottom : 10.0,left: 10,right: 10),
                child: TextField(
                  controller: recovery_email,
                  style: textStyle,

                  onChanged: (val){
                    debugPrint("User Edit the Name ");
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Username/E-mail : " ,
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
            Container(
              child : button,
              margin: EdgeInsets.only(top: 20.0,bottom : 15.0,left: 10,right: 10),
              width: 150,
              height: 50,



            ),
          ],
        ),

      ),


    ));

  }
void navigateToLogin(){
  Navigator.push(this.context, MaterialPageRoute(builder: (context){
    return Userlogin();
  }
  )
  );
}
  void goBack(){
    Navigator.pop(this.context);
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