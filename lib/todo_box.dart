import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share/share.dart';
import 'todolist_modle.dart';
import 'todo_box_present.dart';
import 'base_present.dart';
import 'database_box_helper.dart';


class ToDoBoxPage extends StatefulWidget {
  ToDoBoxPage({Key key}) : super(key: key);

  @override
  _MyToDoBoxPageState createState() => _MyToDoBoxPageState();
}

class _MyToDoBoxPageState extends State<ToDoBoxPage> implements BaseContract{
  MyToDoBoxPresenter myToDoBoxPresenter;
  List<ToDo> myToDoList;

  @override
  void initState() {
    super.initState();
    myToDoBoxPresenter = new MyToDoBoxPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo Box"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<List<ToDo>>(
        future: myToDoBoxPresenter.getToDoList(),
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
                                  caption: 'Share',
                                  color: Colors.indigo,
                                  icon: Icons.share,
                                  onTap: () =>
                                      _doAction(snapshot.data[index], 1),
                                ),
                              ],
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () =>
                                      _doAction(snapshot.data[index], 2),
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
    );
  }

  _doAction(ToDo toDo, int action) {
    switch (action) {
      case 1:
        Share.share(toDo.title + ' ' + toDo.description);
        break;
      case 2:
        deleteRecord(toDo);
        setState(() {});
        break;
    }
  }

  Future deleteRecord(ToDo toDo) async {
    var db = new DatabaseBoxHelper();
    await db.deleteToDo(toDo);
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
