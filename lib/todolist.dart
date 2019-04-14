import 'package:flutter/material.dart';

import 'todolist_modle.dart';
import 'todolist_card.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> toDoList;
  ToDoList(this.toDoList);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: toDoList.length,
      itemBuilder: (context, int) {
        return ToDoCard(toDoList[int]);
      },
    );
  }
}