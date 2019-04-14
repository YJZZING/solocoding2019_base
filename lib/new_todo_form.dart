import 'package:flutter/material.dart';

import 'todolist_modle.dart';
class AddToDoPage extends StatefulWidget {
  @override
  _AddToDoFormPageState createState() => _AddToDoFormPageState();
}

class _AddToDoFormPageState extends State<AddToDoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isChecked = false;
  void _changeChecked(bool value )  => setState(() => isChecked = value);

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a To Do'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                // Text Field is the basic input widget for Flutter.
                // It comes built in with a ton of great UI and
                // functionality, such as the labelText field you see below.
                child: TextField(
                    controller: titleController,
                    onChanged: (v) => titleController.text = v,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: descriptionController,
                    onChanged: (v) => descriptionController.text = v,
                    decoration: InputDecoration(
                      labelText: "Description",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text('Alarm On'),
                    Checkbox(value: isChecked, onChanged: _changeChecked, checkColor: Colors.cyan),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    // The basic Material Design action button.
                    return RaisedButton(
                      // If onPressed is null, the button is disabled
                      // this is my goto temporary callback.
                      onPressed: () => submit(context),
                      color: Colors.blue,
                      child: Text('Submit'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    if (titleController.text.isEmpty) {
      print('ToDo need title!');
    } else {
      var newToDo = ToDo(titleController.text, descriptionController.text);
      newToDo.alarmOn = isChecked;
      Navigator.of(context).pop(newToDo);
    }
  }
}