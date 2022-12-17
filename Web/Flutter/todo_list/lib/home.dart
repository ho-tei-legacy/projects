// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/util/dialog_box.dart';
import 'package:todo_list/util/edit_task_dialog.dart';
import 'package:todo_list/util/my_button.dart';

import 'util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _myBox = Hive.box('debugboxthree');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if 1st time ever opening app, create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();
  //final _editController = TextEditingController();

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void saveExistingTask(int index) {
    setState(() {
      db.toDoList[index][0] = _controller.text;
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateDataBase();
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: (() =>
                  Navigator.of(context).pop()) // dismiss dialog box
              );
        });
  }

  int getIndexOfFirstPinned() {
    if (!db.toDoList[0][2]) return -1; // none are pinned
    int index = 0;
    int cur = 0;
    while (index == 0 && db.toDoList.length - 1 >= index) {
      if (db.toDoList[cur][2]) {
        index = cur;
        break;
      }
      cur++;
    }
    return index;
  }

  int getIndexOfLastPinned() {
    if (!db.toDoList[0][2]) return -1; // none are pinned
    int index = 0;
    int cur = 0;
    while (index == 0 && db.toDoList.length - 1 >= index) {
      if (db.toDoList[cur][2]) {
        index = cur;
      }
      cur++;
    }
    return index;
  }

  int getIndexOfFirstUnpinned() {
    if (!db.toDoList[0][2]) return 0; // first is already unpinned
    int index = 1;
    while (db.toDoList.length + 1 >= index) {
      if (!db.toDoList[index][2]) {
        break;
      }
      index++;
    }
    return index;
  }

  void pinTile(int index) {
    if (db.toDoList[index][2]) {
      var toUnpin = db.toDoList[index];
      int firstUnpinned = getIndexOfFirstUnpinned();
      setState(() {
        toUnpin[2] = false;

        db.toDoList.insert(firstUnpinned, toUnpin);
        db.toDoList.remove(index);
      });
    } else {
      int lastPinned =
          getIndexOfLastPinned() == -1 ? 0 : getIndexOfLastPinned();
      var toPin = db.toDoList[index];

      setState(() {
        toPin[2] = true;

        db.toDoList.insert(lastPinned, toPin);
        db.toDoList.removeAt(index);
      });
    }
  }

  void deleteTask(int index, {bool recall = false}) {
    if ((db.toDoList[index][1] == false) && (recall == false)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: db.themes[db.selectedTheme][1],
              content: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: db.themes[db.selectedTheme][4])),
                      child: Text(
                        "Are you sure you want to delete this todo entry? You haven't completed it yet!",
                        style: TextStyle(
                          color: db.themes[db.selectedTheme][3],
                          fontSize: 10.5,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        MyButton(
                          text: "Yes",
                          onPressed: () => {
                            deleteTask(index, recall: true),
                            Navigator.of(context).pop()
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        MyButton(
                          text: "No",
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    } else {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();
    }
  }

  void editTask(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return EditTaskDialogBox(
              controller: _controller,
              onSave: () => saveExistingTask(index),
              onCancel: (() => Navigator.of(context).pop()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: db.themes[db.selectedTheme][1],
        appBar: AppBar(
          title: const Center(child: Text("TO DO")),
          elevation: 0, // remove shadow
        ),
        drawer: Drawer(
          width: 240,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: db.themes[db.selectedTheme][1]),
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Settings",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              editFunction: (context) => editTask(index),
              pinFunction: (context) => pinTile(index),
            );
          },
        ));
  }
}
