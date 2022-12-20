// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseHandler {
  DocumentReference<Object?>? data;
  User? user = FirebaseAuth.instance.currentUser;

  Future<String> getUsersDocID() async {
    String tmpData = "None";
    if (user == null) return 'User isn\'t logged in';

    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((snapshot) => tmpData = snapshot.docs.first.reference.id);
    return tmpData;
  }

  Future<String> getTodosDocID() async {
    String tmpData = "None";
    if (user == null) return 'User isn\'t logged in';

    await FirebaseFirestore.instance
        .collection('todos')
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((value) => tmpData = value.docs.first.reference.id);
    return tmpData;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataFromDB() async {
    debugPrint("called");
    debugPrint("Test${await getUsersDocID()}");
    Future<DocumentSnapshot<Map<String, dynamic>>> doc = FirebaseFirestore
        .instance
        .collection('users')
        .doc(await getUsersDocID())
        .get();
    debugPrint("GOT DB DATA $doc");
    return await doc;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getTodoDataFromDB() async {
    Future<DocumentSnapshot<Map<String, dynamic>>> doc = FirebaseFirestore
        .instance
        .collection('todos')
        .doc(await getTodosDocID())
        .get();
    return await doc;
  }
}
