// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reminder/pages/database/database.dart';
import 'package:reminder/pages/loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  late Map<String, dynamic> data;
  late Map<String, dynamic> todos;

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  Future fetchUserData() async {
    debugPrint("FETCHING DATA");
    return await DatabaseHandler()
        .getUserDataFromDB()
        .then((value) => data = value.data()!);
  }

  Future fetchTodos() async {
    return await DatabaseHandler().getTodoDataFromDB().then((value) {
      todos = value.data()!;
      todos.remove('uid');
      return todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchTodos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${snapshot.data[index.toString()]}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return LoadingPage();
        }
      },
    );
  }
}
