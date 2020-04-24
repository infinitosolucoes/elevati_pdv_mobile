import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'db_sql.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.getInstance();
  DbHelper.getInstance();

  factory DbHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbsql_dbName);
    print("db $path");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future _onCreate(Database db, int newVersion) async {

    String s = dbsql_createdb;

    List<String> sqls = s.split(";");

    for(String sql in sqls) {
      if(sql.trim().isNotEmpty) {
        print("sql: $sql");
        await db.execute(sql);
      }
    }
  }

  Future<FutureOr<void>> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("_onUpgrade: oldVersion: $oldVersion > newVersion: $newVersion");
    if(oldVersion == 1 && newVersion == 2) {
      await db.execute(dbsql_updatedb_v2);
    }
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}