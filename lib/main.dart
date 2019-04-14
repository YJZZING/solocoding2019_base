import 'package:flutter/material.dart';

import 'todolist_modle.dart';
import 'todolist.dart';

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
  List<ToDo> initialToDo = []
    ..add(ToDo('일기', '오늘의 일기 쓰기'))
    ..add(ToDo('영어', 'Easy English 듣기'))
    ..add(ToDo('운동', '러닝머신 20분'));

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
    );
  }
}
