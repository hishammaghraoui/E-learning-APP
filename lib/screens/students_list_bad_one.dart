//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app2/screens/sql_test.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_app2/models/user.dart';
//
//
//
// // class StudentsList extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: StudentsState(title: 'Students'),
// //     );
// //   }
// // }
// Map<String, String> headers = {
//   'Content-Type': 'application/json;charset=UTF-8',
//   'Charset': 'utf-8'
// };
//
// class StudentsList extends StatefulWidget {
//
//
//   @override
//   _StudentsState createState() => _StudentsState();
// }
//
// class _StudentsState extends State<StudentsList> {
// int l ;
// List<User> users = [];
//   // int _counter = 0;
//   // var db = new Mysql();
//   // var mail = '';
//   //
//   // void _getCustomer() {
//   //   db.getConnection().then((conn) {
//   //     String sql = 'select * from user;';
//   //     conn.query(sql).then((results) {
//   //       for(var row in results){
//   //         setState(() {
//   //           mail = row[0];
//   //         });
//   //       }
//   //     });
//   //     conn.close();
//   //   });
//   //   print (mail);
//   // }
//   Future<List<User>> _getUsers() async {
//     //  // String data = await rootBundle.loadString('assets/user.json');
//     //   // Uri.parse(
//     //  //  //_getCustomer();
//     //   var url = 'http://192.168.1.38:80/ci/index.php/api/fetch_user';
//     //  http.Response response = await http.get(url , headers:headers);
//     //   var jsonData = json.decode(response.body);
//     // // var jsonData = json.decode(data);
//     //   // if (response.statusCode == 200) {
//     //   //   print("successe");
//     //   //   print(jsonData.toString());
//     //   // } else {
//     //   //   print('A network error occurred');
//     //   // }
//     //
//     //   // String data = await DefaultAssetBundle.of(context).loadString("assets/user.json");
//     //   // var jsonData = json.decode(data);
//     //   List<User> users= [];
//     //   for(var u in jsonData) {
//     //     User user = User(u["ID"], u["name"], u["email"], u["password"], u["CIN"], u["type"],u["phoneNumber"],u["classID"],u["CNE"]);
//     //     users.add(user);
//     //     print (user.name);
//     //   }
//     //
//     //   print("the count is " + users.length.toString());
//     //   return users;
//     //   final response =
//     //   await http.get(Uri.parse('http://192.168.1.38:80/ci/index.php/api/fetch_student'));
//     //
//     //   if (response.statusCode == 200) {
//     //     // If the server did return a 200 OK response,
//     //     // then parse the JSON.
//     //     List<User> users= [];
//     //     int i=0;
//     //     for(var u in jsonDecode(response.body)){
//     //       u = User.fromJson(jsonDecode(response.body)[i]);
//     //       users.add(u);
//     //       print(users[i].name.toString());
//     //       i++;
//     //       return users;
//     //     }
//     //   } else {
//     //     // If the server did not return a 200 OK response,
//     //     // then throw an exception.
//     //     throw Exception('Failed to load album');
//     //   }
//     var data = await http.get(
//         'http://192.168.1.38:80/ci/index.php/api/fetch_student');
//
//     var jsonData = json.decode(data.body);
//
//
//
//     int i = 0 ;
//     for (var u in jsonData) {
//       i++;
//       User user = User(
//           u["ID"],
//           u["name"],
//           u["email"],
//           u["password"],
//           u["CIN"],
//           u["type"],
//           u["phoneNumber"],
//           u["classID"],
//           u["CNE"]);
//
//       users.add(user);
//     }
//     for (int n=0;n<=i;n++){
//       print(users[n].name);
//     }
//     //print(users.length);
//     l=users.length ;
//
//     return users;
//   }
//
//   void initState() {
//     _getUsers();
//     super.initState();
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   // TODO: implement build
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text("students "),
//   //     ),
//   //     body: Container(
//   //       child: FutureBuilder(
//   //   future: _getUsers(),
//   //   builder: (BuildContext context, AsyncSnapshot snapshot){
//   //   print(snapshot.data);
//   //   if (snapshot.data == null){
//   //   return ColorLoader2(
//   //   color1: Colors.redAccent,
//   //   color2: Colors.green,
//   //   color3: Colors.amber,
//   //   );
//   //   } else {
//   //   return ListView.builder(
//   //   itemCount: snapshot.data.lenght,
//   //   itemBuilder: (BuildContext context, int index){
//   //   return ListTile(
//   //   leading: CircleAvatar(
//   //   backgroundImage: NetworkImage(
//   //   snapshot.data[index].pic
//   //   ),
//   //   ),
//   //   title: Text(snapshot.data[index].name),
//   //   subtitle: Text(snapshot.data[index].dep),
//   //   ),
//   //
//   //   )
//   //   ),
//   //   )
//   //   );
//   //     // This trailing comma makes auto-formatting nicer for build methods.
//   //
//   // }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF21BFBD),
//       body:
//
//         ListView(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 15.0, left: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios),
//                   color: Colors.white,
//                   onPressed: () {},
//                 ),
//                 Container(
//                   width: 125.0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(Icons.filter_list),
//                         color: Colors.white,
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.menu),
//                         color: Colors.white,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 25.0,),
//           Padding(
//             padding: EdgeInsets.only(left: 40.0),
//             child: Row(
//               children: <Widget>[
//                 Text('Restaurant',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25.0
//                   ),
//                 ),
//                 SizedBox(width: 10.0,),
//                 Text('Food',
//                   style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       color: Colors.white,
//                       fontSize: 25.0
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 40.0,),
//           Container(
//             height: MediaQuery.of(context).size.height - 185.0,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
//             ),
//             child: ListView(
//               primary: false,
//               padding: EdgeInsets.only(left: 25.0, right: 25.0),
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 45.0),
//                   child: Container(
//
//                     child : FutureBuilder(
//                       future:  _getUsers(),
//
//                     child: ListView(
//                       children: <Widget>[
//
//                           _bulidStudentItem(
//                               'images/default.jpg',users[1].name, users[1].email)
//
//                       ],
//                     ),
//                   )
//                   )
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("students "),
//     //   ),
//     //   body: Container(
//     //     child: FutureBuilder(
//     //       future: _getUsers(),
//     //       builder: (context, snapshot) {
//     //         if (snapshot.hasData) {
//     //           return Text(snapshot.data.name.toString());
//     //         } else if (snapshot.hasError) {
//     //           return Text("${snapshot.error}");
//     //         }
//     //
//     //         // By default, show a loading spinner.
//     //         return CircularProgressIndicator();
//     //       },
//     //       // builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
//     //       //  //return null;
//     //       //      return ListView.builder(
//     //       //        itemCount: asyncSnapshot.data.length,
//     //       //        itemBuilder: (BuildContext context, int index) {
//     //       //          return ListTile(
//     //       //            title: Text(asyncSnapshot.data[index].name),
//     //       //            leading: CircleAvatar(
//     //       //              backgroundImage: AssetImage(
//     //       //                 "images/default.jpg"
//     //       //              ),
//     //       //            ),
//     //       //            subtitle: Text(asyncSnapshot.data[index].email) ,
//     //       //            onTap: () {
//     //       //              Navigator.push(context,
//     //       //                  new MaterialPageRoute(builder: (context) => DetailPage(asyncSnapshot.data[index]))
//     //       //              );
//     //       //            },
//     //       //          );
//     //       //        },
//     //       //      );
//     //
//     //       // },
//     //     ),
//     //   ),
//     //   // This trailing comma makes auto-formatting nicer for build methods.
//     // );
//   }
//
// }
//   class DetailPage extends StatelessWidget {
//
//   final User user;
//
//   DetailPage(this.user);
//
//   @override
//   Widget build(BuildContext context) {
//   // TODO: implement build
//   return Scaffold(
//   appBar: AppBar(
//   title: Text(user.name),
//   ),
//   body: Container(
//   child: Center(
//   child: Text(this.user.email),
//   ),
//   ),
//   );
//   }
//
// }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_app2/models/student.dart';
// //
// // import 'dart:async';
// //
// // import 'package:sqflite/sqflite.dart';
// //
// // class StudentsList extends StatefulWidget{
// //
// //   @override
// //   State<StatefulWidget> createState() {
// //     // TODO: implement createState
// //     return StudentsState();
// //   }
// // }
// //
// // class StudentsState extends State<StudentsList> {
// //
// //
// //   List<Student> studentsList=[Student("hicham", "maghraoui", "ASR"),Student("ayoub", "khadrani", "ASR"),Student("amin", "maghraoui", "ASR")];
// //   int count = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     if (studentsList == null) {
// //       studentsList = new List<Student>();
// //       //updateListView();
// //     }
// //
// //     // TODO: implement build
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Students"),
// //         ),
// //         body: Column(children: studentsList.map((student)=> getStudentsList(student)).toList() ,
// //
// //         // floatingActionButton: FloatingActionButton(
// //         //   onPressed: () {
// //         //    // navigateToStudent(Student('', '', 1, ''), "Add New Student");
// //         //   },
// //         //   tooltip: 'Add Student',
// //         //   child: Icon(Icons.add),
// //         // )
// //       ),
// //     );
// //   }
// //
// //   ListView getStudentsList(Student) {
// //
// //     return ListView.builder(
// //         itemCount: count,
// //         itemBuilder: (BuildContext context, int position) {
// // //           return Card(
// // //
// // //             margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,0),
// // //             child : Padding(
// // //               padding: const EdgeInsets.all(12.0),
// // //               child :Column(
// // //
// // //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                 children: <Widget>[
// // //
// // //                   Text(
// // //                    Student.name,
// // //                     style: TextStyle(
// // //                       fontSize: 30,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.grey[600],
// // //                     ),
// // //
// // //                   ),
// // //                   SizedBox(height: 5,),
// // //                   Text(
// // //                     Student.date,
// // //                     style: TextStyle(
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.w200,
// // //                       color: Colors.grey[600],
// // //                     ),
// // //
// // //                   ),
// // //                   SizedBox(height: 10,),
// // //
// // //                   //SizedBoxheight: 8,),
// // // //
// // //                   // Image.asset('course_C++.png'),
// // //
// // //
// // //
// // //
// // //                 ],
// // //               ),
// // //
// // //
// // //
// // //
// // //
// // //             ),
// // //           );
// //           return Card(
// //             color: Colors.white,
// //             elevation: 2.0,
// //             child: ListTile(
// //               leading: CircleAvatar(
// //                 backgroundColor: isPassed(Student.filire),
// //                 child: getIcon(Student.filire),
// //               ),
// //               title: Text(Student.name),
// //               subtitle: Text(Student.filire + " | " +
// //                   Student.date),
// //               // trailing:
// //               // GestureDetector(
// //               //   child: Icon(Icons.delete, color: Colors.grey,),
// //               //   onTap: () {
// //               //     _delete(context, this.studentsList[position]);
// //               //   },
// //               // )
// //
// //               onTap: () {
// //                 //navigateToStudent(this.studentsList[position], "Edit Student");
// //               },
// //             ),
// //
// //           );
// //         });
// //   }
// //
// //   Color isPassed(String value) {
// //     switch (value) {
// //       case "ASR":
// //         return Colors.blue;
// //         break;
// //       case "GE":
// //         return Colors.green;
// //         break;
// //       default:
// //         return Colors.blue;
// //     }
// //   }
// //
// //   Icon getIcon(String value) {
// //     switch (value) {
// //       case "ASR":
// //         return Icon(Icons.laptop);
// //         break;
// //       case "GE":
// //         return Icon(Icons.biotech);
// //         break;
// //       default:
// //         return Icon(Icons.check);
// //     }
// //   }
// //
// //   // void _delete(BuildContext context, Student student) async {
// //   //   int ressult = await helper.deleteStudent(student.id);
// //   //   if (ressult != 0) {
// //   //     _showSenckBar(context, "Student has been deleted");
// //   //     updateListView();
// //   //   }
// //   // }
// //
// //   void _showSenckBar(BuildContext context, String msg) {
// //     final snackBar = SnackBar(content: Text(msg),);
// //     Scaffold.of(context).showSnackBar(snackBar);
// //   }
// //
// //   // void updateListView() {
// //   //   final Future<List<>Student> db = new Student("","","") ;
// //   //   db.then((database) {
// //   //     Future<List<Student>> students = helper.getStudentList();
// //   //     students.then((theList) {
// //   //       setState(() {
// //   //         this.studentsList = theList;
// //   //         this.count = theList.length;
// //   //       });
// //   //     });
// //   //   });
// //   // }
// //
// //   // void navigateToStudent(Student student, String appTitle) async {
// //   //   bool result = await Navigator.push(
// //   //       context, MaterialPageRoute(builder: (context) {
// //   //     return StudentDetail(student, appTitle);
// //   //   }));
// //   //
// //   //   if (result) {
// //   //     updateListView();
// //   //   }
// //   // }
// // }
// Widget _bulidStudentItem(String imgPath, String foodName, String prince){
//   return Padding(
//     padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//     child: InkWell(
//       onTap: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             child: Row(
//               children: <Widget>[
//                 Hero(
//                   tag: imgPath,
//                   child: Image(
//                       image: AssetImage(imgPath),
//                       fit: BoxFit.cover,
//                       height: 75.0,
//                       width: 75.0
//                   ),
//                 ),
//                 SizedBox(width: 10.0,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       foodName,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Text(
//                       foodName,
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 15.0,
//                           color: Colors.grey
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             color: Colors.black,
//             onPressed: () {},
//           )
//         ],
//       ),
//     ),
//   );
// }