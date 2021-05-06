import 'package:flutter/material.dart';

class Task {
  final String name;
  final String description;
  final String date;
  final String duration;
  // bool isdone;

  Task(this.name, this.description, this.date, this.duration);

  // void toggleDone() {
  //   isdone = !isdone;
  // }
}
