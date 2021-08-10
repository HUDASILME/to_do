import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/pages/alltasks%20.dart';
import 'package:todo_app/pages/completetask.dart';
import 'package:todo_app/adding/newtask.dart';

import 'pages/incompleted.dart';

void main() {
  runApp(MaterialApp(home: Todo()));
}

// class APP extends StatefulWidget {
//   @override
//   _APPState createState() => _APPState();
// }

// class _APPState extends State<APP> {
//   bool val = false;

//   TextEditingController TextController = new TextEditingController();
//   TextEditingController TextController2 = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('new form'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             TextField(
//               controller: TextController,
//             ),
//             TextField(
//               controller: TextController2,
//             ),
//             Checkbox(value: val, onChanged: (val) {}),
//             ElevatedButton(
//                 onPressed: () {
//                   val
//                       ? Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => newpage()))
//                       : AlertDialog(title: Text('you dont acc'));
//                   setState(() {});
//                 },
//                 child: Text('submint'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class newpage extends StatelessWidget {
//   TextEditingController TextController = new TextEditingController();
//   TextEditingController TextController2 = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [Text(TextController.text), Text(TextController2.text)],
//       ),
//     );
//   }
// }


    // routes: {
    //   'Screen1': (context) => page1(),
    //   'screen2': (context) => page2(),
    //   'screen3': (context) => page3('')
    // },
//     onGenerateRoute: (RouteSettings routSettings){
//  String routName=routSettings.name;
// var arguments=routSettings.arguments;
// switch (x){
//  case1
//   return MaterialPagerout()
// }

// }
//     //  },
//   ));
// }

class Todo extends StatefulWidget {
  Function addnewTask;
  Todo([this.addnewTask]);
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // addTask(var task) {
  //   Data.tasks.add(task);
  //   setState(() {});
  // }

  delettTask(Task task) {
    Data.tasks.remove(task);
    setState(() {});
  }

  updateTask(Task task) {
    task.isComplete = !task.isComplete;
    int index = Data.tasks.indexOf(task);
    Data.tasks[index] = task;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newtask()),
                );
              },
              icon: Icon(Icons.add),
              alignment: Alignment.centerRight,
            )
          ],
          title: Text('TODO HUDA APP'),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('all_tasks')),
              Tab(child: Text('complete_tasks')),
              Tab(child: Text('incomplete_tasks')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Alltasks(delettTask, updateTask),
            Complete(delettTask, updateTask),
            Incomplete(delettTask, updateTask)
          ],
        ),
      ),
    );
  }
}
//.............

// class Todo extends StatefulWidget {
//   @override
//   _TodoState createState() => _TodoState();
// }

// class _TodoState extends State<Todo> {
//   delettask(Task task) {
//     Data.tasks.remove(task);
//     setState(() {});
//   }

//   updatetask(Task task) {
//     int x = Data.tasks.indexOf(task);
//     Data.tasks[x] = task;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('ToDo Application'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 child: Text('All Tasks'),
//               ),
//               Tab(
//                 child: Text('Complete Tasks'),
//               ),
//               Tab(
//                 child: Text('In complete'),
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             ALL(delettask, updatetask),
//             Complete(delettask, updatetask),
//             InComplete(delettask, updatetask)
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Task {
//   String title;
//   bool isComplete;
//   Task(this.title, this.isComplete);
// }

// class Data {
//   static List<Task> tasks = [
//     Task('playing', true),
//     Task('playing', true),
//     Task('playing', false),
//     Task('playing', true),
//     Task('playing', true),
//     Task('playing', false),
//   ];
// }

// class Task_item extends StatelessWidget {
//   Function deletfun;
//   Function updatefun;
//   Task task;
//   Task_item(this.task, {this.deletfun, this.updatefun});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: task.isComplete ? Colors.black : Colors.blue),
//       child: ListTile(
//         leading: IconButton(
//             onPressed: () {
//               this.deletfun(task);
//             },
//             icon: Icon(Icons.delete)),
//         title: Text(
//           task.title,
//           style: TextStyle(color: Colors.white54),
//         ),
//         trailing: Checkbox(
//           value: task.isComplete,
//           onChanged: (value) {
//             this.updatefun(task);
//           },
//         ),
//       ),
//     );
//   }
// }

// class ALL extends StatelessWidget {
//   Function deletfun;
//   Function updatefun;
//   ALL(this.deletfun, this.updatefun);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: Data.tasks.length,
//         itemBuilder: (context, index) {
//           return Task_item(
//             Data.tasks[index],
//             deletfun: deletfun,
//             updatefun: updatefun,
//           );
//         });
//   }
// }

// class Complete extends StatelessWidget {
//   Function deletfun;
//   Function updatefun;
//   Complete(this.deletfun, this.updatefun);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: Data.tasks.where((element) => element.isComplete).length,
//         itemBuilder: (context, index) {
//           return Task_item(
//             Data.tasks.where((element) => element.isComplete).toList()[index],
//             deletfun: deletfun,
//             updatefun: updatefun,
//           );
//         });
//   }
// }

// class InComplete extends StatelessWidget {
//   Function deletfun;
//   Function updatefun;
//   InComplete(this.deletfun, this.updatefun);
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: Data.tasks.where((element) => !element.isComplete).length,
//         itemBuilder: (context, index) {
//           return Task_item(
//             Data.tasks.where((element) => !element.isComplete).toList()[index],
//             deletfun: deletfun,
//             updatefun: updatefun,
//           );
//         });
//   }
// }
// class Todo extends StatefulWidget {
//   @override
//   _TodoState createState() => _TodoState();
// }

// class _TodoState extends State<Todo> {
//   @override
//   Widget build(BuildContext context) {
//     return page1();
//   }
// }

// class page1 extends StatefulWidget {
//   @override
//   _page1State createState() => _page1State();
// }

// class _page1State extends State<page1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('pag1'),
//       ),
//       body: Center(
//           child: ElevatedButton(
//               child: Text('press1'),
//               onPressed: () async {
//                 String result =
//                     await Navigator.of(context).pushNamed('Screen1');
//               })),
//     );
//   }
// }

// class page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('pag2'),
//       ),
//       body: Center(
//           child: ElevatedButton(
//         child: Text('press2'),
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return page3('hello');
//           }));
//         },
//       )),
//     );
//   }
// }

// class page3 extends StatelessWidget {
//   String ss;
//   page3(this.ss);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(ss),
//       ),
//       body: Center(
//           child: ElevatedButton(
//         child: Text('press3'),
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute ( builder: (context) {
//             return page1();
//           }));
//         },
//       )),
//     );
//   }
// }
