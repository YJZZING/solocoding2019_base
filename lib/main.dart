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
        primarySwatch: Colors.yellow,
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewToDoForm,
          ),
        ],
      ),
      body: Container(
        child: ToDoList(initialToDo),
      ),
    );
  }

  Future _showNewToDoForm() async {
    // push a new route like you did in the last section
    ToDo newToDo = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddToDoPage();
        },
      ),
    );
    // A null check, to make sure that the user didn't abandon the form.
    if (newToDo != null) {
      // Add a newDog to our mock dog array.
      initialToDo.add(newToDo);
    }
  }
}
