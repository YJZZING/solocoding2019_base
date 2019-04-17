import 'dart:convert';

class ToDo {
  int id;
  final String title;
  final String description;
  String alarmTime;
  int alarmOn;
  int color;

  ToDo(
      {this.title,
      this.description,
      this.alarmTime,
      this.alarmOn,
      this.color});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'alarmTime': alarmTime,
      'alarmOn': alarmOn,
      'color': color,
    };
  }

  void setId(int id){
    this.id = id;
  }
}
