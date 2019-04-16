class ToDo {
  final String title;
  final String description;
  String startTime =  new DateTime.now().toIso8601String();
  String endTime=  new DateTime.now().toIso8601String();
  bool alarmOn = false;
  int color = 0xFFFFFFFF;

  ToDo(this.title, this.description);
}