import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference box
  final _myBox = Hive.box('mybox');

  // 1st overall startup
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
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
