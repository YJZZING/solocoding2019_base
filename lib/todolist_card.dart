import 'package:flutter/material.dart';

import 'todolist_modle.dart';

class ToDoCard extends StatefulWidget {
  final ToDo toDo;

  ToDoCard(this.toDo);

  @override
  _ToDoCardState createState() => _ToDoCardState(toDo);
}

class _ToDoCardState extends State<ToDoCard> {
  ToDo toDo;

  _ToDoCardState(this.toDo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: toDoItem,
            ),
          ],
        ),
      ),
    );
  }

  Widget get toDoItem {
    return Container(
      width: double.infinity,
      height: 115.0,
      child: Card(
        color: widget.toDo.background,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.toDo.title,
                  style: Theme.of(context).textTheme.headline),
              Text(widget.toDo.description,
                  style: Theme.of(context).textTheme.subhead),
            ],
          ),
        ),
      ),
    );
  }
}
