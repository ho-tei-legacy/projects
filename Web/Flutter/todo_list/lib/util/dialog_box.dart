import 'package:flutter/material.dart';
import 'package:todo_list/util/my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller; // required to be able to access information in home page
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
        backgroundColor: Colors.yellow[300],
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 120,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // user input
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Add a new task"),
                ),

                // buttons -> save + cancel
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
