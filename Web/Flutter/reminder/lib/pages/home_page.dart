// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reminder/pages/database/database.dart';
import 'package:reminder/pages/loading_page.dart';
import 'package:reminder/pages/templates/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  DatabaseHandler db = DatabaseHandler();
  late Map<String, dynamic> data;
  late Map<String, dynamic> todos;
  @override
  void initState() {
    debugPrint(db.getTodos().toString());
    super.initState();
  }

  _handleCheckbox(bool value, int index) {
    setState(() {
      var _tmp = db.getTodos();
      //debugPrint(_tmp[index].toString());
      _tmp[index.toString()][1] = !_tmp[index.toString()][1];
      db.updateSingleTodoCache(_tmp[index.toString()], index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[400],
        child: Icon(
          Icons.add,
          size: 28,
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        width: 220,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[600]),
              child: Column(
                verticalDirection: VerticalDirection.up,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome, ${db.getData()['username']}",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: db.getTodos().length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskName: '${db.getTodos()[index.toString()][0]}',
                    taskCompleted: db.getTodos()[index.toString()][1],
                    //taskName: '${snap.[index.toString()][0]}',
                    //taskCompleted: todos[index.toString()][1],
                    onChanged: (value) => _handleCheckbox(value!, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
