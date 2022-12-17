import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  List defaultList = [
    [
      "Do my workout", // ToDo Name
      false, // isCompleted
      false, // isPinned
    ]
  ];
  //             0          1        2      3     4         5           6
  // Format: [primary, background, entry, text, border, checkMark, checkBorder]
  List themes = [
    [
      Colors.deepPurple,
      Colors.deepPurple.shade300,
      Colors.deepPurple.shade200,
      Colors.grey.shade200,
      Colors.white70,
      Colors.black,
      Colors.white,
    ],
    [
      Colors.brown,
      Colors.brown.shade300,
      Colors.brown.shade200,
      Colors.grey.shade200,
      Colors.white70,
      Colors.black,
      Colors.white
    ]
  ];
  int selectedTheme = 0;

  // reference box
  final _myBox = Hive.box("debugboxthree");

  // 1st overall startup
  void createInitialData() {
    toDoList = defaultList;
  }

  // load data from db
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update db
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
