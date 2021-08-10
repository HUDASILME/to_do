import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/model/task_model.dart';

class newtask extends StatefulWidget {
  @override
  _newtaskState createState() => _newtaskState();
}

class _newtaskState extends State<newtask> {
  TextEditingController TextController = new TextEditingController();

  Function addfun;
  Function apdatefun;
  Task task;

  addTask(String task) {
    Task X = Task(task, false);
    Data.tasks.add((X));
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: TextController,
            obscureText: true,
          ),
          Checkbox(
            value: false,
            onChanged: (value) {
              //    task.isComplete ? addfun(task) : apdatefun(task);
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Todo(addTask((TextController.text)))),
                );
              },
          child: Text('add to my tasks'))
        ],
      ),
    );
  }
}
