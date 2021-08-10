import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/wedget/task_item.dart';

class Alltasks extends StatelessWidget {
  Function deletefun;
  Function updatefun;
  Alltasks(this.deletefun, this.updatefun);
  @override
  Widget build(BuildContext context) {
    return Data.tasks.isEmpty
        ? Center(
            child: Text('there is no task'),
          )
        : ListView.builder(
            itemCount: Data.tasks.length,
            itemBuilder: (context, index) {
              return taskitem(Data.tasks[index],
                  deletefun: deletefun, updatefun: updatefun);
            });
  }
}
