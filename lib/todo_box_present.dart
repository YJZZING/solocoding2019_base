import 'dart:async';
import 'database_box_helper.dart';
import 'todolist_modle.dart';

abstract class MyToDoBoxContract {
  void screenUpdate();
}

class MyToDoBoxPresenter {
  MyToDoBoxContract _view;
  var db = new DatabaseBoxHelper();
  MyToDoBoxPresenter(this._view);

  delete(ToDo todo) {
    var db = new DatabaseBoxHelper();
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