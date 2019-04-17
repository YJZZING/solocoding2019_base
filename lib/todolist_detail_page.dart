import 'package:flutter/material.dart';

import 'todolist_modle.dart';

class ToDoDetailPage extends StatefulWidget {
  final ToDo toDo;

  ToDoDetailPage(this.toDo);

  @override
  _ToDoDetailPageState createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  // The widget that displays the image, rating and dog info.
  Widget get toDoDetail {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title : ${widget.toDo.title}',
              style: TextStyle(fontSize: 32.0),
            ),
            Text(
              'Descrption : ${widget.toDo.description}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Alarm : ${widget.toDo.alarmOn.toString()}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Time : ${widget.toDo.alarmTime}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This is a new page, so you need a new Scaffold!
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('${widget.toDo.title}'),
      ),
      body: toDoDetail,
    );
  }
}