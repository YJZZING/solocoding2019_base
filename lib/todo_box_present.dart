import 'dart:async';
import 'database_box_helper.dart';
import 'todolist_modle.dart';
import 'base_present.dart';

class MyToDoBoxPresenter extends BasePresenter {
  var db = new DatabaseBoxHelper();

  MyToDoBoxPresenter(BaseContract view) : super(view);

  delete(ToDo todo) {
    var db = new DatabaseBoxHelper();
    db.deleteToDo(todo);
    updateScreen();
  }

  Future<List<ToDo>> getToDoList() {
    return db.getToDoList();
  }
}