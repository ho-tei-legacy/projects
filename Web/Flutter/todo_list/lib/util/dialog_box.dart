import 'package:flutter/material.dart';
import 'package:todo_list/data/database.dart';
import 'package:todo_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller; // required to be able to access information in home page
  ToDoDataBase db = ToDoDataBase();
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: db.themes[db.selectedTheme][1],
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 120,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // user input
                TextField(
                  controller: controller,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      fontSize: 12, color: db.themes[db.selectedTheme][3]),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: db.themes[db.selectedTheme][4])),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: db.themes[db.selectedTheme][4]),
                    ),
                    hintText: "Add a new task",
                    hintStyle: TextStyle(
                        fontSize: 12, color: db.themes[db.selectedTheme][3]),
                  ),
                ),

                // buttons -> save + cancel
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // save
                      MyButton(text: "Save", onPressed: onSave),

                      const SizedBox(width: 8),

                      // cancel
                      MyButton(text: "Cancel", onPressed: onCancel)
                    ])
              ]),
        ));
  }
}
