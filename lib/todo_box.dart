import 'package:flutter/material.dart';

import 'todolist_modle.dart';
import 'todolist.dart';
import 'todo_box_present.dart';

class ToDoBoxPage extends StatefulWidget {
  ToDoBoxPage({Key key}) : super(key: key);

  @override
  _MyToDoBoxPageState createState() => _MyToDoBoxPageState();
}

class _MyToDoBoxPageState extends State<ToDoBoxPage> implements MyToDoBoxContract{
  MyToDoBoxPresenter myToDoBoxPresenter;

  @override
  void initState() {
    super.initState();
    myToDoBoxPresenter = new MyToDoBoxPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo Box"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<List<ToDo>>(
        future: myToDoBoxPresenter.getToDoList(),
        builder: (BuildContext context, AsyncSnapshot<List<ToDo>> snapshot) {
          if (snapshot.hasData) {
            return ToDoList(snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
