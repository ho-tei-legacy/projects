import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:todo_list/data/database.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  ToDoDataBase db = ToDoDataBase();

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  }); // constructors

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const BehindMotion(),
            extentRatio: .35,
            children: [
              SlidableAction(
                onPressed: editFunction,
                icon: Icons.settings,
                backgroundColor: Colors.blue.shade800,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.redAccent.shade700,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              )
            ]),
        child: Container(
          padding:
              const EdgeInsets.only(left: 3, top: 12, right: 3, bottom: 12),
          decoration: BoxDecoration(
              color: db.themes[db.selectedTheme][2],
              //border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: db.themes[db.selectedTheme][5],
                side: BorderSide(color: db.themes[db.selectedTheme][6]),
              ),

              // task name
              Expanded(
                child: AutoSizeText(taskName,
                    style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: db.themes[db.selectedTheme][5],
                        color: db.themes[db.selectedTheme][3]),
                    maxLines: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
