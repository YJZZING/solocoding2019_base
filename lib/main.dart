import 'package:flutter/material.dart';

import 'todolist_modle.dart';
import 'todolist.dart';
import 'new_todo_form.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: 'solocoding2019', // application name
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyMainPage(title : 'To do List'),
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage>{
  List<ToDo> initialToDo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: ToDoList(initialToDo),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: _showNewToDoForm,
          tooltip: 'Add ToDo',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future _showNewToDoForm() async {
    ToDo newToDo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddToDoPage();
        },
      ),
    );

    if (newToDo != null) {
      initialToDo.add(newToDo);
    }
  }
}
