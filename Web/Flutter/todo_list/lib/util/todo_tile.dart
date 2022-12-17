// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:todo_list/data/database.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  Function(BuildContext)? pinFunction;

  ToDoDataBase db = ToDoDataBase();

  bool isPinned(var getFrom) {
    if (getFrom.runtimeType == String) {
      int index = getIndexFromName(getFrom);
      if (index == -1) return false;
      return db.toDoList[getFrom][2];
    } else if (getFrom.runtimeType == int) {
      return db.toDoList[getFrom][2];
    }
    return false;
  }

  int getIndexFromName(String name) {
    if (db.toDoList.isEmpty) return -1;
    if (db.toDoList[0][0] == name) return 0; // first is already searched for
    int index = 0;
    while (db.toDoList.length + 1 >= index) {
      if (db.toDoList[index][0] == name) {
        return index;
      }
      index++;
    }
    return -1;
  }

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
    required this.pinFunction,
  }); // constructors

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: .5,
            children: [
              SlidableAction(
                  onPressed: pinFunction,
                  icon: Icons.push_pin_outlined,
                  backgroundColor: Colors.blueAccent.shade700,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              SlidableAction(
                onPressed: editFunction,
                icon: Icons.settings,
                backgroundColor: Colors.blue.shade900,
              ),
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.redAccent.shade700,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
            ]),
        child: Container(
          padding:
              const EdgeInsets.only(left: 3, top: 12, right: 3, bottom: 12),
          decoration: BoxDecoration(
              color: db.themes[db.selectedTheme][2],
              //border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: db.themes[db.selectedTheme][5],
                side: BorderSide(color: db.themes[db.selectedTheme][6]),
              ),
              Icon(isPinned(taskName)
                  ? Icons.push_pin
                  : Icons.push_pin_outlined),
              // task name
              Expanded(
                child: TextButton(
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () => onChanged!(!taskCompleted),
                  child: AutoSizeText(taskName,
                      style: TextStyle(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: db.themes[db.selectedTheme][5],
                          color: db.themes[db.selectedTheme][3]),
                      maxLines: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
