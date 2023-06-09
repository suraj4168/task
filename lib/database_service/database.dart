
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DatabaseService {

  static const String DB_Name = 'user.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserName TEXT, "
        " $C_Email TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_Email)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    final db = await instance.database;

    var res = await db.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String userId, String password) async {
    final db = await instance.database;
    var res = await db.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Email = '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    final db = await instance.database;
    var res = await db.update(Table_User, user.toMap(),
        where: '$C_Email = ?', whereArgs: [GetStorage().read('email')]);
    return res;
  }


}
