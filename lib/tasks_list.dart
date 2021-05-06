import 'package:flutter/material.dart';
import 'package:todotask/add_screen.dart';
import 'tasks_tile.dart';
import 'task_model.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  onDelete(Task taskModel) {
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text("Delete Task"),
              content: new Text("Do you want to delete this task?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.tasks.remove(taskModel);
                      Navigator.pop(context);
                    });
                  },
                  child: new Text('Yes'),
                ),
              ],
            ));
  }

  onUpdate(Task taskModel, int index) {
    //Add screen with data
    showModalBottomSheet(
      context: context,
      //  isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddScreen(
            task: taskModel,
            addTaskCallback: (newTask, index) {
              setState(() {
                widget.tasks[index] = newTask;
              });
              Navigator.pop(context);
            },
            index: index,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, ind) {
        return TaskTile(
          taskModel: widget.tasks[ind],
          onDelete: onDelete,
          onUpdate: onUpdate,
          index: ind,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
