import 'package:flutter/material.dart';

class ToDo {
  final String title;
  final String description;
  DateTime startTime = new DateTime(10, 1, 4);
  DateTime endTime= new DateTime(10, 1, 5);
  bool alarmOn = false;
  MaterialColor background;

  ToDo(this.title, this.description);
}