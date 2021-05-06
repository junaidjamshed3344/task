import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'task_model.dart';

class AddScreen extends StatefulWidget {
  final Function addTaskCallback;
  final Task task;
  final int index;
  AddScreen({this.addTaskCallback, this.task, this.index});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  // DateFormat formatter = DateFormat('yyyy-MM-dd');

  String newTaskDate = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  @override
  void initState() {
    initializeData();
    super.initState();
  }

  initializeData() {
    if (widget.task != null) {
      titleController.text = widget.task.name;
      descriptionController.text = widget.task.description;
      durationController.text = widget.task.duration;
      newTaskDate = widget.task.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'Title:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: titleController,
                      onChanged: (newText) {},
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: descriptionController,
                      onChanged: (newText) {},
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Duration:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: durationController,
                      onChanged: (newText) {},
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  width: 32.0,
                ),
                Text(
                  newTaskDate.toString(),
                ),
                SizedBox(
                  width: 50.0,
                ),
                RaisedButton(
                  child: Text(
                    'Pick a date',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () async {
                    DateTime pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2024),
                    );

                    if (pickeddate != null && pickeddate != newTaskDate) {
                      setState(() {
                        newTaskDate = formatter.format(pickeddate);
                      });
                    }
                  },
                ),
              ],
            ),
            FlatButton(
              child: Text(
                widget.index != null ? 'Update' : 'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                widget.addTaskCallback(
                    Task(
                      titleController.text,
                      descriptionController.text,
                      newTaskDate,
                      durationController.text,
                    ),
                    widget.index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
