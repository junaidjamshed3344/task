import 'package:flutter/material.dart';
import 'task_model.dart';
class TaskTile extends StatelessWidget {
  final Task taskModel;
  final Function onDelete;
  final Function onUpdate;
  final int index;

  TaskTile({this.taskModel, this.onDelete, this.onUpdate, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          this.onUpdate(taskModel, index);
        },
        onLongPress: () {
          this.onDelete(taskModel);
        },
        title: Row(
          children: [
            Text(
              'Title:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(taskModel.name ?? ''),
          ],
        ),
        subtitle: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(taskModel.description ?? ''),
              ],
            ),
            Row(
              children: [
                Text(
                  'Duration:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(taskModel.duration ?? ''),
              ],
            ),
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(taskModel.date ?? ''),
              ],
            )
          ],
        ));
  }
}
