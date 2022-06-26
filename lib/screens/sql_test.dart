import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'sql308.epizy.com',
      user = 'epiz_28328015',
      password = 'cnnm5RYEBn2K',
      db = 'epiz_28328015_eestk';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db
    );
    return await MySqlConnection.connect(settings);
  }
}