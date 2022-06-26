import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/models/student.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class SQL_Helper{
  static SQL_Helper dbHelper;
  static Database _database;
  SQL_Helper._createInstant();
  factory SQL_Helper(){
    if (dbHelper==null){
      dbHelper=SQL_Helper._createInstant();
    }
    return dbHelper;
  }
  String tableName = "user";
  String _id="ID";
  String _name="name";
  String _email="email";
  String _filire="class";
  String _password="password";
  String _date="birthDate";
  Future<Database> get database async{
    if (_database==null){
      _database= await intializedDatabase();

    }
    return _database;
  }
  Future<Database> intializedDatabase() async{
    Directory directory =await getApplicationDocumentsDirectory();
    String path= directory.path + "user.db";
    var studentDB = await openDatabase(path ,version: 1, onCreate: createDatabase );
    return studentDB;
  }


  void createDatabase(Database db,int version) async{
    await db.execute("CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT , $_name TEXT, $_email TEXT,$_password TEXT , $_date TEXT ,$_filire TEXT");
  }
  Future < List<Map<String , dynamic>>>getStudentMaplist () async{
    Database db = await this.database;
    var result = await db.query(tableName , orderBy: "$_id ASC");
    return result;
  }
  Future<int> insertStudent (Student student) async{
    Database Db=await this.database;
    var rslt =await Db.insert(tableName, student.toMap());
    return rslt;
  }
  Future<int> updateStudent (Student student) async{
    Database Db=await this.database;
    var rslt =await Db.update(tableName, student.toMap(),where: "$_id = ?",whereArgs: [student.id]);
    return rslt;
  }
  Future<int> deleteStudent (Student student)async{
    Database db =await this.database;
    var rslt = await db.rawDelete("DELETE FROM $tableName WHERE $_id =id");
    return rslt;
  }
  Future<int> getCount() async{
    Database db =await this.database;
    List<Map<String , dynamic>> all =await db.rawQuery("SELECT COUNT (*) FROM $tableName");
    int rslt = Sqflite.firstIntValue(all);
    return rslt;
  }
}