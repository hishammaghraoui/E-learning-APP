import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/models/user.dart';

import 'package:flutter_app2/screens/drawer_page1.dart';

import 'package:flutter_app2/utilties/databse.dart';

import 'package:flutter_app2/vedio/test_vid.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:g_captcha/g_captcha.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';


class read_course extends StatefulWidget{
  int y;
  read_course(this.y);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _read_course();
  }

}
class _read_course extends State<read_course>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Icon customicon=Icon(Icons.search, size: 26.0,);
  Widget cusSearchBar = Text("Classes");
  String std_name;
  Map<String,String> newUser ={};
  Future _userFuture;
  List<classes_blueprint> classe = [classes_blueprint("PDF",  "JAVA" ,"images/java.png"),classes_blueprint("GE",  "biologie","images/biologie.jpg" )];

  @override
  void iniState(){
    super.initState();
    _userFuture=getUser();
  }
  getUser() async{
    final _userData =await DBProvider.db.getUser();
    return _userData;
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scaffoldKey,
      drawer: Theme(

        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, //This will change the drawer background to blue.
          //other styles
        ),

        child :AppDrawer(widget.y),
      ),

      backgroundColor: Color(0xffF7941E),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),

                Flexible(
                  flex : 1,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.grey.shade100
                          )
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 20,
                  splashColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Media Library',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),
                ),
                SizedBox(width: 10.0,),
                // Text('Food',
                //   style: TextStyle(
                //       fontFamily: 'Montserrat',
                //       color: Colors.white,
                //       fontSize: 25.0
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[


                SingleChildScrollView(
                  child : Column(
    children: <Widget>[

                  Container(
                      child: FeaturedVideoCard(
                        title: 'C++ Course',

                        thumbnailURL:
                    'https://hackr.io/blog/cpp-course/thumbnail/large',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return test();
                          }));
                        },
                      ),
                    ),
                       Column(
                  children: classe.map((classes_blueprint1)=> class_card(classes_blueprint1)).toList() ,
           )
                ]
                )
                )


    ]

            ),
          )
        ],
      ),

    ) ;



  }
  ListView getCoursesAdd(){

  }
  _openReCaptcha() async {
    String tokenResult = await GCaptcha.reCaptcha(
        "6LcLP0QaAAAAAJGcV9g2BboBdEMwCvnuh68S_YUE");
    print('tokenResult: $tokenResult');
    Fluttertoast.showToast(msg: tokenResult, timeInSecForIosWeb: 4);
    // return true ;
  }
  Widget class_card (classes_blueprint){
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return test();
          }));


        },

        child : Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,0),
          child : Padding(
            padding: const EdgeInsets.all(12.0),
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.asset(
                          '${classes_blueprint.pic}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        right: 20.0,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'test',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Image.asset(
                //   '${classes_blueprint.pic}',
                //
                //   height: 100,
                //   width: 50,
                // ),
                Text(
                  classes_blueprint.elemnt,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),

                ),
                SizedBox(height: 5,),
                Text(
                  classes_blueprint.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.grey[600],
                  ),

                ),
                // SizedBox(height: 10,),


                // ButtonBar(
                //     children: <Widget>[
                //       SizedBox.fromSize(
                //         size: Size(56, 56), // button width and height
                //         child: ClipOval(
                //           child: Material(
                //             color: Colors.white, // button color
                //             child: InkWell(
                //               splashColor: Colors.orangeAccent, // splash color
                //               onTap: () {}, // button pressed
                //               child:
                //               Icon(Icons.edit,color: Colors.blue,), // icon
                //
                //               // text
                //
                //             ),
                //           ),
                //         ),
                //       ),
                //
                //       SizedBox.fromSize(
                //         size: Size(56, 56), // button width and height
                //         child: ClipOval(
                //           child: Material(
                //             color: Colors.white, // button color
                //             child: InkWell(
                //               splashColor: Colors.orangeAccent, // splash color
                //               onTap: () {}, // button pressed
                //               // child: Column(
                //               //   mainAxisAlignment: MainAxisAlignment.center,
                //               // children: <Widget>[
                //               child:
                //               Icon(Icons.restore_from_trash,color: Colors.red,), // icon
                //               // Text("remove", style:  TextStyle(
                //               //   color: Colors.white,
                //               //
                //               // ),
                //               // )
                //               // text
                //               // ],
                //             ),
                //           ),
                //         ),
                //       ),
                //       // ),
                //     ]
                // )

                //SizedBox(height: 8,),
//
                // Image.asset('course_C++.png'),




              ],
            ),





          ),
        )
    );

  }
}
class classes_blueprint {
  String name;
  String pic;
  String elemnt;

  classes_blueprint(this.name,  this.elemnt,this.pic);
}
