import 'package:flutter/material.dart';

class ToDo {
  final String title;
  final String description;
  DateTime startTime;
  DateTime endTime;
  bool alarmOn;
  MaterialColor background;

  ToDo(this.title, this.description);
}