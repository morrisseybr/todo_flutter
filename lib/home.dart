import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoGroupComponent.dart';
import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoGroup> todoGroup;

  @override
  Widget build(BuildContext context) {
    todoGroup = MemoryTodoGroupsDatabase().getAll();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              iconSize: Theme.of(context).iconTheme.size,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
              // FIXME: Colocado aqui e não no tema por conta de um bug no Flutter. #58752 já corrigidio, esperando release.
              iconSize: Theme.of(context).iconTheme.size,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 8),
            itemCount: todoGroup.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TodoGroupComponent(
                index: index,
                todoGroup: todoGroup[index],
                isLast: index == todoGroup.length - 1 ? true : false,
              );
            }));
  }
}
