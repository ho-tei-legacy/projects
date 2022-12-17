import 'package:flutter/material.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('debugboxthree');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          primarySwatch: ToDoDataBase().themes[ToDoDataBase().selectedTheme]
              [0]), // good idea to use if you have multiple pages
    );
  }
}
