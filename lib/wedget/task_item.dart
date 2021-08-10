import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/model/task_model.dart';

class taskitem extends StatelessWidget {
  Function deletefun;
  Function updatefun;
  Task task;
  taskitem(this.task, {this.deletefun, this.updatefun});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: task.isComplete ? Colors.yellow : Colors.red,
        ),
        child: ListTile(
          leading: IconButton(
              onPressed: () {
                this.deletefun(task);
              },
              icon: Icon(Icons.delete)),
          title: Text(task.title),
          trailing: Checkbox(
            value: task.isComplete,
            onChanged: (value) {
              this.updatefun(task);
            },
          ),
        ));
  }
}
