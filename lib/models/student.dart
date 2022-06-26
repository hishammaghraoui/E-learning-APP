import 'package:flutter/cupertino.dart';

class Student {
  String _id;
  String _name;
  String _email;
  String _password;
  String _date;
  String _filire;


  Student(this._name, this._date, this._filire);


  Student.withid(this._id, this._name, this._email, this._password, this._date,
      this._filire);

  String get date => _date;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  String get id => _id;
  String get filire => _filire;

  set date(String value) {
    if (value.length<55) {
      _date = value;
    }
  }

  set password(String value) {
    if (value.length<255) {
      _password = value;
    }
  }

  set email(String value) {
    if (value.length<255) {
      _email = value;
    }
  }

  set name(String value) {
    if (value.length<255) {
      _name = value;
    }
  }
  Map<String, String> toMap(){
    var map= Map<String , dynamic>();
    map["ID"]=this._id;
    map["name"]=this.name;
    map["email"]=this._email;
    map["class"]=this._filire;
    map["password"]=this._password;
    map["birthDate"]=this._date;
    return map;
  }
  Student.getMap(Map<String , dynamic> map){
    this._id=map["ID"];
    this.name=map["name"];
    this._email=map["email"];
    this._filire=map["class"];
    this._password=map["password"];
    this._date=map["birthDate"];
  }
}