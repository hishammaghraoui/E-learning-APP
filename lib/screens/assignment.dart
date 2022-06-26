import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/models/user.dart';
import 'package:flutter_app2/screens/profile_test.dart';
import 'package:flutter_app2/screens/student_list.dart';
import 'package:flutter_app2/screens/students_list_bad_one.dart';
import 'package:flutter_app2/screens/proflie.dart';
import 'package:flutter_app2/screens/drawer_page1.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'Quiz_screen.dart';
import 'drawer_page1.dart';
import 'list_user.dart';
import 'login_screen.dart';

class assignment extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _assignment();
  }

}

class _assignment extends State<assignment>{
  int y;
  Future<List<String>> pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    return result == null ? <String>[] : result.paths;
  }
  Icon customicon=Icon(Icons.search, size: 26.0,);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget cusSearchBar = Text("Classes");
  String std_name;
  List<classes_blueprint> classe = [classes_blueprint("ASR","images/ARS.jpg"),classes_blueprint("GE" ,"images/GE.jpg")];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.init(context, designSize: Size(
      ScreenSize.width,
      ScreenSize.height,
    ),  allowFontScaling: true);
    return  Scaffold(

      key: _scaffoldKey,
      drawer: Theme(

        data: Theme.of(context).copyWith(
          canvasColor: Colors.white, //This will change the drawer background to blue.
          //other styles
        ),

        child :AppDrawer(y),
      ),

      backgroundColor: Color(0xffF7941E),
      body:ListView(
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
                Text('Assignment',
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
                  child :Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                            child: AssignmentCard(
                              deadline: DateTime.now(),
                              question:
                              'Create a SOIP API(Please submit in word format with names attached)',
                              subject: 'UML',
                              teacher: 'Dr. Ouhda Med',
                              deadlineBackgroundColor: SchoolToolkitColors.red,
                              onUploadHandler: ()  async {
                                final filePaths = await pickFile();
                              },
                              fileList: [
                                FileWrapper(
                                  fileName: 'assignment-information.pdf',
                                  fileSize: '11.5 KB',
                                  onTap: () {
                                    print('Handle on tap');
                                  },
                                ),
                                FileWrapper(
                                  fileName: 'assignment-information-2.pdf',
                                  fileSize: '11.5 KB',
                                  onTap: () {
                                    print('Handle on tap');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                            child: AssignmentCard(
                              deadline: DateTime.now(),
                              question:
                              'TP 7 Analyse (Please submit in PDF format with names attached)',
                              subject: 'Mathematics',
                              teacher: 'Mr H.Bezioui',
                              deadlineBackgroundColor: SchoolToolkitColors.darkYellow,
                              onUploadHandler: ()  async {
                                final filePaths = await pickFile();
                              },
                              fileList: [
                                FileWrapper(
                                  fileName: 'TP7.pdf',
                                  fileSize: '1.5 MB',
                                  onTap: () {
                                    print('Handle on tap');
                                  },
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                            child: AssignmentCard(
                              deadline: DateTime.now(),
                              question:
                              'Create a TIC-TAC-TOE app(Please submit in .zip format with names attached and codes)',
                              subject: 'JAVA',
                              teacher: 'Mr ABIDI',
                              deadlineBackgroundColor: SchoolToolkitColors.red,
                              onUploadHandler: ()  async {
                                final filePaths = await pickFile();
                              },
                              fileList: [
                                FileWrapper(
                                  fileName: 'X_O.pdf',
                                  fileSize: '300.5 KB',
                                  onTap: () {
                                    print('Handle on tap');
                                  },

                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                )


              ],
            ),
          )
        ],
      ),


    ) ;


  }
  ListView getCoursesAdd(){

  }

  Widget class_card (classes_blueprint){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return list("test");
          // return UserPage();
        }));


      },

      child : Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,0),


        child :Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //padding : EdgeInsets.all (10),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              // SizedBox(height: 5,),
              // Text(
              //   classes_blueprint.name,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w200,
              //     color: Colors.grey[600],
              //   ),
              //
              // ),


              Image.asset(
                '${classes_blueprint.image}',
                height: 150,
                width: 100,
              ),
              SizedBox(height: 10,),
              Text(
                classes_blueprint.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),

              ),
              //SizedBox(height: 8,),
//
              // Image.asset('course_C++.png'),




            ],
          ),
        ),





      ),

    );


  }


}
class MyImage extends StatelessWidget {
  @override
  String name;

  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage('name');
    Image myImg =new Image(image: image, width: 150,height: 100,);
    return Container(child: myImg,
      margin: EdgeInsets.only(left:30, top: 25 , right: 30,),);
  }

}
class classes_blueprint {
  String name;


  String image;
  classes_blueprint(this.name, this.image);
}
class ScreenSize {
  static const double width = 500.0;
  static const double height = 900.0;
}

