import 'dart:async';
import 'database_helper.dart';
import 'todolist_modle.dart';
import 'base_present.dart';

class MyMainPresenter extends BasePresenter{
  var db = new DatabaseHelper();

  MyMainPresenter(BaseContract view) : super(view);

  delete(ToDo todo) {
    var db = new DatabaseHelper();
    db.deleteToDo(todo);
    updateScreen();
  }

  Future<List<ToDo>> getToDoList() {
    return db.getToDoList();
  }
}