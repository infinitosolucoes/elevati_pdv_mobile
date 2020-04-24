import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'db_entity.dart';
import 'db_helper.dart';

// Data Access Object
abstract class DbRepository<T extends DbEntity>{

  Future<Database> get db => DbHelper.getInstance().db;

  String get tableName;

  T fromJson(Map<String,dynamic> map);

  Future<int> save(T entity) async {
    var dbClient = await db;
    print('save from $entity');
    var id = await dbClient.insert(tableName, entity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<T>> query(String sql,[List<dynamic> arguments]) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery(sql,arguments);

    return list.map<T>((json) => fromJson(json)).toList();
  }

  Future<List<T>> findAll() {
    return query('select * from $tableName');
  }

  Future<T> findById(int id, String column) async {
    List<T> list =
    await query('select * from $tableName where $column = ?', [id]);

    return list.length > 0 ? list.first : null;
  }

  Future<bool> exists(int id, String column) async {
    T c = await findById(id, column);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    var dbClient = await db;
    var list = await dbClient.rawQuery('select count(*) from $tableName');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    print('delete from $tableName');
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName');
  }

}