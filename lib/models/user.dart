import 'package:flutter/material.dart';
class User {

  final String ID;
  final String name;
  final String email;
  final String firstpassword;
  final String CIN;
  final String CNE;
  final String type ;
  final String phoneNumber;
  final String classID;
  final String Avatar="images/defaul.jpg";


  User(this.ID, this.name, this.email, this.firstpassword, this.CIN, this.type, this.phoneNumber, this.classID, this.CNE);
 // User({
 //    @required this.ID,
 //   @ required this.name,
 //   @ required this.email,
 //  @ required this.password,
 //  @ required this.CIN,
 //  @ required this.CNE,
 //   @required this.type,
 //  @ required this.phoneNumber,
 //  @ required this.classID,
 //  });
 //
 //
 //  factory User.fromJson(Map<String, dynamic> json) {
 //    return User(
 //      ID: json['ID'],
 //      name: json['name'],
 //      email: json['email'],
 //      password: json['password'],
 //      CIN: json['CIN'],
 //      CNE: json['CNE'],
 //      type: json['type'],
 //      phoneNumber: json['phoneNumber'],
 //      classID: json['classID'],
 //    );
 //  }
 //  User.fromJson(Map<String, dynamic> json)
 //      :
 //  ID= json['ID'],
 //  name= json['name'],
 //  email= json['email'],
 //  firstpassword= json['firstpassword'],
 //  CIN=json['CIN'],
 //  CNE= json['CNE'],
 //  type= json['type'],
 //  phoneNumber=json['phoneNumber'],
 //  classID=json['classID'];
 //
 //  Map<String, dynamic> toJson() => {
 //
 //    'ID':ID,
 //    'name':name ,
 //    'email': email,
 //    'firstpassword':firstpassword ,
 //    'CIN':CIN ,
 //    'CNE':CNE ,
 //    'type':type ,
 //    'phoneNumber' :phoneNumber ,
 //    'classID':classID ,
 //  };
}
