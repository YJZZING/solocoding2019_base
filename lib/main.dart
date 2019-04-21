import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todolist_modle.dart';
import 'new_todo_form.dart';
import 'main_present.dart';
import 'todo_box.dart';
import 'base_present.dart';
import 'database_box_helper.dart';
import 'database_helper.dart';


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
        primarySwatch: Colors.cyan,
      ),
      home: MyMainPage(title: 'ToDo List'),
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> implements BaseContract {
  MyMainPresenter myMainPresenter;
  List<ToDo> myToDoList;

  @override
  void initState() {
    super.initState();
    myMainPresenter = new MyMainPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            icon: Icon(Icons.inbox),
            onPressed: _showToDoBox,
          ),
        ],
      ),
      body: FutureBuilder<List<ToDo>>(
        future: myMainPresenter.getToDoList(),
        builder: (BuildContext context, AsyncSnapshot<List<ToDo>> snapshot) {
          if (snapshot.hasData) {
            myToDoList = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      height: 115.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              child: Slidable(
                                delegate: new SlidableStrechDelegate(),
                                actionExtentRatio: 0.25,
                                child: Container(
                                  width: double.infinity,
                                  height: 115.0,
                                  child: Card(
                                    color: new Color(
                                        snapshot.data[index].color),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 8.0,
                                        left: 8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: <Widget>[
                                          Text(snapshot.data[index].title,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .headline),
                                          Text(snapshot.data[index].description,
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .subhead),
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
                                    onTap: () =>
                                        _doAction(snapshot.data[index], 1),
                                  ),
                                  IconSlideAction(
                                    caption: 'Share',
                                    color: Colors.indigo,
                                    icon: Icons.share,
                                    onTap: () =>
                                        _doAction(snapshot.data[index], 2),
                                  ),
                                ],
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () =>
                                        _doAction(snapshot.data[index], 3),
                                  ),
                                ],
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: _showNewToDoForm,
          tooltip: 'Add ToDo',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future _showNewToDoForm() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddToDoPage();
        },
      ),
    );
    setState(() {});
  }

  _doAction(ToDo toDo, int action) {
    switch (action) {
      case 1:
        deleteRecord(toDo);
        addBoxRecord(toDo);
        setState(() {});
        break;
      case 2:
        break;
      case 3:
        deleteRecord(toDo);
        setState(() {});
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

  @override
  void screenUpdate() {
    setState(() {});
  }

  Future _showToDoBox() async {
    // push a new route like you did in the last section
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ToDoBoxPage();
        },
      ),
    );
  }

}
