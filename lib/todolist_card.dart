import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'todolist_modle.dart';
import 'todolist_detail_page.dart';
import 'database_box_helper.dart';
import 'database_helper.dart';

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
    return InkWell(
      onTap: showToDoDetailPage,
      child: Padding(
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
      ),
    );
  }

  Widget get toDoItem {
    return Slidable(
      delegate: new SlidableStrechDelegate(),
      actionExtentRatio: 0.25,
      child: Container(
        width: double.infinity,
        height: 115.0,
        child: Card(
          color: new Color(widget.toDo.color),
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
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _doAction(1),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _doAction(2),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _doAction(3),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _doAction(4),
        ),
      ],
    );
  }

  showToDoDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ToDoDetailPage(toDo);
        },
      ),
    );
  }

  _doAction(int action) {
    switch(action) {
      case 1:
        deleteRecord(toDo);
        addBoxRecord(toDo);
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
    }
  }

  Future deleteRecord(ToDo toDo) async {
    var db = new DatabaseHelper();
    await db.deleteToDo(toDo);
  }

  Future addBoxRecord(ToDo newToDo) async {
    var db = new DatabaseBoxHelper();
    await db.saveToDo(newToDo);
  }
}
