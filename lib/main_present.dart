import 'dart:async';
import 'database_helper.dart';
import 'todolist_modle.dart';

abstract class MyMainContract {
  void screenUpdate();
}

class MyMainPresenter {
  MyMainContract _view;
  var db = new DatabaseHelper();
  MyMainPresenter(this._view);
  delete(ToDo todo) {
    var db = new DatabaseHelper();
    db.deleteToDo(todo);
    updateScreen();
  }

  Future<List<ToDo>> getToDoList() {
    return db.getToDoList();
  }

  updateScreen() {
    _view.screenUpdate();

  }
}