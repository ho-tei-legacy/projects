import 'package:flutter/material.dart';
import 'package:todo_list/data/database.dart';

class MyButton extends StatelessWidget {
  var defaultColor = Colors.grey.shade700;
  final String text;
  ToDoDataBase db = ToDoDataBase();
  VoidCallback onPressed;
  var textColor;
  var borderColor;

  MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side:
              BorderSide(color: borderColor ?? db.themes[db.selectedTheme][4]),
          elevation: 0,
          fixedSize: Size(128, 12)),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? db.themes[db.selectedTheme][3],
        ),
      ),
    );
  }
}
