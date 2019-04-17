import 'dart:async';
import 'dart:io' as io;

import 'todolist_modle.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      "CREATE TABLE ToDo(id INTEGER PRIMARY KEY, title TEXT, description TEXT, alarmTime TEXT, alarmOn INTEGER, color INTEGER)",
    );
  }

  Future<int> saveToDo(ToDo todo) async {
    var dbClient = await db;
    int res = await dbClient.insert("ToDo", todo.toMap());
    return res;
  }

  Future<List<ToDo>> getToDoList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM ToDo');
    List<ToDo> todoList = new List();
    for (int i = 0; i < list.length; i++) {
      var todo = new ToDo(
          title: list[i]["title"],
          description: list[i]["description"],
          alarmTime: list[i]["alarmTime"],
          alarmOn: list[i]["alarmOn"],
          color: list[i]["color"]);
      todo.setId(list[i]["id"]);
      todoList.add(todo);
    }
    print(todoList.length);
    return todoList;
  }

  Future<int> deleteToDo(ToDo todo) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM ToDo WHERE id = ?', [todo.id]);
    return res;
  }

  Future<bool> update(ToDo todo) async {
    var dbClient = await db;
    int res = await dbClient.update("ToDo", todo.toMap(),
        where: "id = ?", whereArgs: <int>[todo.id]);
    return res > 0 ? true : false;
  }
}
