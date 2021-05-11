import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_one/models/task.dart';
import 'package:todo_one/models/todo.dart';
import 'package:todo_one/widgets.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableTask = 'tasks';
  static final _tableTodo = 'Todos';

  static final columnId = 'id';
  static final taskId = 'taskId';
  static final title = 'title';
  static final isDone = 'isDone';
  static final description = 'description';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _dataBase;
  Future<Database> get _database async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await _initiateDatabase();

    return _dataBase;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute(''' 
    CREATE TABLE $_tableTask (
    $columnId INTEGER PRIMARY KEY,
    $title TEXT,
    $description TEXT)
      ''');
    db.execute(''' 
    CREATE TABLE $_tableTodo (
    $columnId INTEGER PRIMARY KEY,
    $taskId INTEGER,
    $title TEXT NOT NULL,
    $isDone INTEGER
     )
      ''');
  }

  Future<int> insertTask(Task task) async {
    Database db = await instance._database;
    return await db.insert(_tableTask, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await instance._database;
    return await db.insert(_tableTodo, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  // Future<int> insert(Map<String,dynamic> row) async {
  //   Database db = await instance._database;
  //   return await db.insert(_tableTask, row);
  // }

  Future<List<Map<String, dynamic>>> queryAllTasks() async {
    Database db = await instance._database;
    return await db.query(_tableTask);
  }
  Future<List<Widget>> getCategories() async {
    Database db = await instance._database;
    List<Map<String, dynamic>> taskMap = await db.query(_tableTask);
    return List.generate(taskMap.length, (index){
      return Category(
        colorType: taskMap[index]["id"],
        title: taskMap[index]["title"],
      );
    },);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance._database;
    int id = row[columnId];
    return await db
        .update(_tableTask, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance._database;
    return await db.delete(_tableTask, where: '$columnId = ?', whereArgs: [id]);
  }
}
