import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:flutter_app2/models/student.dart';

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;
  Future<Database> get database async{
    if (_database!=null)
    return _database;

    _database=await initDB();
    return _database;
  }
  // query of create user
  // CREATE TABLE `user` (
  // `ID` int(11) NOT NULL,
  // `name` varchar(40) NOT NULL,
  // `email` varchar(100) NOT NULL,
  // `password` varchar(100) NOT NULL,
  // `type` char(7) NOT NULL,
  // `birthDate` date NOT NULL,
  // `class` varchar(20) NOT NULL,
  // `phoneNumber` varchar(9) NOT NULL,
  // `CIN` varchar(10) NOT NULL,
  // `CNE` varchar(10) NOT NULL,
  // `gender` char(1) NOT NULL,
  // `speciality` varchar(100) NOT NULL
  // ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  initDB() async{
    return await openDatabase(
      join(await getDatabasesPath(),'login.db'),
      onCreate:(db, version ) async {
        await db.execute('''
        CREATE TABLE users (
            name TEXT, password TEXT , email TEXT
        )
           ''');
      },
      version: 1
    );
  }
  newUser(newUser) async {
    final db =await database;
    var res = await db.rawInsert('''
      INSERT INTO users(
      name, password, email
      ) VALUES (?, ?, ?)
    ''',[newUser.name , newUser.password,newUser.email ]);
    return res;
  }
  Future<dynamic> getUser() async{
    final db = await database;
    var res = await await db.query("users");
    if(res.length==0){
      return null;
    }
    else{
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
}