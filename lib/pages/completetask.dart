import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/wedget/task_item.dart';

class Complete extends StatelessWidget {
  Function deletefun;
  Function updatefun;
  Complete(this.deletefun, this.updatefun);
  @override
  Widget build(BuildContext context) {
    return Data.tasks.where((element) => element.isComplete).isEmpty
        ? Center(
            child: Text('there is no task'),
          )
        : ListView.builder(
            itemCount: Data.tasks.where((element) => element.isComplete).length,
            itemBuilder: (context, index) {
              return taskitem(
                  Data.tasks
                      .where((element) => element.isComplete)
                      .toList()[index],
                  deletefun: deletefun,
                  updatefun: updatefun);
            });
  }
}
