import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  String taskName;
  bool taskCompleted;
  Function(bool?)? onChanged;
  String _addZero(String input) {
    if (input.length == 1) {
      return "0$input";
    }
    return input;
  }

  String _getTime() {
    String hour = _addZero(DateTime.now().hour.toString());
    String minute = _addZero(DateTime.now().minute.toString());
    return "$hour:$minute";
  }

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: .5,
            children: [
              SlidableAction(
                  onPressed: null,
                  icon: Icons.push_pin_outlined,
                  backgroundColor: Colors.blueAccent.shade700,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              SlidableAction(
                onPressed: null,
                icon: Icons.settings,
                backgroundColor: Colors.blue.shade900,
              ),
              SlidableAction(
                onPressed: null,
                icon: Icons.delete,
                backgroundColor: Colors.redAccent.shade700,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
            ]),
        child: Container(
          padding:
              const EdgeInsets.only(left: 3, top: 12, right: 3, bottom: 12),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              //border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_getTime()),
                    Text(
                      "${DateTime.now().day}/${DateTime.now().month}, ${DateTime.now().year}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),

              /*Icon(isPinned(taskName)
                  ? Icons.push_pin
                  : Icons.push_pin_outlined),*/
              // task name
              Expanded(
                child: TextButton(
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () {},
                  child: AutoSizeText(taskName,
                      style: TextStyle(
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: Colors.black,
                          color:
                              taskCompleted ? Colors.grey[700] : Colors.black),
                      maxLines: 12),
                ),
              ),

              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                checkColor: Colors.white,
                side: BorderSide(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
