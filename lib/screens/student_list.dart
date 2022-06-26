// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app2/screens/profile_test.dart';
// import 'package:flutter_app2/screens/proflie.dart';
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
//
// Map<String, String> headers = {
//   'Content-Type': 'application/json;charset=UTF-8',
//   'Charset': 'utf-8'
// };
// List<User> users = [];
// class StudentsList extends StatefulWidget {
//
//
//   @override
//   _StudentsState createState() => _StudentsState();
// }
//
// class _StudentsState extends State<StudentsList> {
//   int l ;
//
//
//   Future<Map> getJson() async {
//     String url =
//         "http://192.168.1.38:80/ci/index.php/api/fetch_student";
//     http.Response response = await http.get(url);
//
//     Map<String, dynamic> userMap = jsonDecode(response.body);
//     // var user = User.fromJson(userMap);
//    //List<dynamic> user = jsonDecode(response.body);
//     //var user = User.fromJson(userMap);
//
//     print('Howdy, ${user.name}!');
//     print('We sent the verification link to ${user.email}.');
//
//     return userMap;
//   }
//
//   Widget updateTemp(){
//     return new FutureBuilder(
//         future: _getUsers(),
//         builder:(BuildContext context , AsyncSnapshot snapshot){
//           List<User> content = snapshot.data;
//           String cont  = content[0].name  ;
//           print (cont
//           );
//           if(snapshot.hasData){
//
//
//             return new Container(
//               child: Column(
//                 children: <Widget>[
//                   new ListTile(
//                     title: new Text(" }",
//                       style: TextStyle(),),
//                   ),
//                 ],
//               ),
//             );
//           }else{
//             return new Container(
//              child : Text("kkk"),
//             );
//           }
//         }
//     );
//   }
//   Future<List<User>> _getUsers() async {
//
//     var data = await http.get(
//         'http://192.168.1.38:80/ci/index.php/api/fetch_student');
//
//     var jsonData = json.decode(data.body);
//     final parsed = jsonDecode(data.body).cast<Map<String, dynamic>>();
//
//     //users=  parsed.map<User>((json) => User.fromJson(json)).toList();
//
//     Map<String, dynamic> userMap = jsonDecode(data.body);
//     int i = 0 ;
//
//     // for (var user in jsonData) {
//     //   i++;
//     //
//     //   // var user = User.fromJson(userMap);
//     //   //List<dynamic> user = jsonDecode(response.body);
//     //
//     //   // User user = User(
//     //   //     u["ID"],
//     //   //     u["name"],
//     //   //     u["email"],
//     //   //     u["firstpassword"],
//     //   //     u["CIN"],
//     //   //     u["type"],
//     //   //     u["phoneNumber"],
//     //   //     u["classID"],
//     //   //     u["CNE"]);
//     //
//     //   users.add(user);
//     //
//     // }
//     print(users.length);
//     for (int n=0;n<=users.length;n++){
//       print(users[n].name);
//     }
//     //print(users.length);
//     l=users.length ;
//     print(l);
//
//      return parsed;
//
//   }
//
//   void initState() {
//
//     _getUsers();
//     updateTemp();
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('students'),
//       ),
//       body:
//       updateTemp(),
//       // ListView.builder(
//       //     itemCount: users == null? 0: users.length,
//       //     itemBuilder:(BuildContext context, o ) {
//       //       return new ListTile(
//       //         title : new Text (users[o].name),
//       //         subtitle: new Text(users[o].email),
//       //         leading: new CircleAvatar(
//       //           backgroundImage: new AssetImage("images/default.jpg"),
//       //         ),
//       //         onTap:() {
//       //           User test=users[o];
//       //           Navigator.push(
//       //             context , new MaterialPageRoute(builder: (BuildContext context)=>new ProfilePage(test)
//       //           )
//       //           );
//       //
//       //         },
//       //       );
//       //     },
//       //
//       // ),
//     );
//   }
// }
