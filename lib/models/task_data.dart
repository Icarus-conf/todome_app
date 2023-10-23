import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todome_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Say to Toty I love her'),
    Task(name: 'Buy Gamosa Milk for Toty'),
    Task(name: 'Play scary games with Toty'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateData(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteData(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
