// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> data = {};
Map<String, dynamic> todos = {};
String todoDocID = "TMP";
String dataDocID = "TMP";

class DatabaseHandler {
  User? user = FirebaseAuth.instance.currentUser;

  // cache user data
  Future fetchUserData({bool openApp = false}) async {
    if (openApp && data.isNotEmpty) return data;
    debugPrint("FETCHING DATA");
    return await getUserDataFromDB()
        .then((value) => (setDataCache(value.data()!)));
  }

  // cache todos
  Future fetchTodos({bool openApp = false}) async {
    if (openApp && todos.isNotEmpty) return todos;
    return await getTodoDataFromDB().then((value) {
      var _tmp = value.data()!;
      _tmp.remove('uid');
      setTodosCache(_tmp);
      return _tmp;
    });
  }

  // get users doc id from db
  Future<String> getUsersDocID() async {
    String tmpData = "None";
    //if (user == null) return 'User isn\'t logged in';

    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((snapshot) => tmpData = snapshot.docs.first.reference.id);
    setDataDocID(tmpData);
    return tmpData;
  }

  // get users todo doc id from db
  Future<String> getTodosDocID() async {
    String tmpData = "None";
    var s = await FirebaseFirestore.instance
        .collection('todos')
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((value) => tmpData = value.docs.first.reference.id);
    setTodoDocID(tmpData);
    return tmpData;
  }

  // get user data from db
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataFromDB() async {
    Future<DocumentSnapshot<Map<String, dynamic>>> doc = FirebaseFirestore
        .instance
        .collection('users')
        .doc(await getUsersDocID())
        .get();
    return await doc;
  }

  // get todo data from db
  Future<DocumentSnapshot<Map<String, dynamic>>> getTodoDataFromDB() async {
    Future<DocumentSnapshot<Map<String, dynamic>>> doc = FirebaseFirestore
        .instance
        .collection('todos')
        .doc(await getTodosDocID())
        .get();
    return await doc;
  }

  Map<String, dynamic> getData() {
    return data;
  }

  Map<String, dynamic> getTodos() {
    return todos;
  }

  String getTodoDocID() {
    return todoDocID;
  }

  String getDataDocID() {
    return dataDocID;
  }

  void setDataCache(var newData) {
    data.clear();
    data.addAll(newData);
  }

  void setTodosCache(var newTodos) {
    todos.clear();
    todos.addAll(newTodos);
  }

  void updateSingleTodoCache(var newTodo, int index) {
    todos.update(index.toString(), (value) => newTodo);
  }

  void updateSingleDataCache(var newData, int index) {
    data.update(index.toString(), (value) => newData);
  }

  Future uploadCacheToDB() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(dataDocID)
        .set(data);

    var _newTodos = todos;
    _newTodos['uid'] = data['uid'];
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(todoDocID)
        .set(_newTodos);
  }
}

void setDataDocID(String id) {
  dataDocID = id;
}

void setTodoDocID(String id) {
  todoDocID = id;
}
