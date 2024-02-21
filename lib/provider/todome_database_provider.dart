import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todome_app/models/task.dart';

class TodomeDatabase extends ChangeNotifier {
  TodomeDatabase() {
    db = openDB();
    init();
  }

  DateTime selectedDate = DateTime.now();

  selectDate(DateTime date) {
    selectedDate = date;
  }

  late Future<Isar?> db;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> init() async {
    final isar = await db;
    isar!.txn(() async {
      final todoCollection = isar.tasks;
      _tasks = await todoCollection.where().findAll();

      notifyListeners();
    });
  }

  Future<Isar?> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [TaskSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Isar.getInstance();
  }

  Future<void> addTask(Task task) async {
    final isar = await db;
    await isar!.writeTxn(() async {
      await isar.tasks.put(task);
      _tasks.add(task);
      notifyListeners();
    });
  }

  Future<void> updateTask(
    Task task,
    String newTitle,
    DateTime updatedDate,
  ) async {
    final isar = await db;

    isar!.writeTxn(() async {
      task.title = newTitle;
      task.createdDate = updatedDate;
      await isar.tasks.put(task);

      int taskIndex = _tasks.indexWhere((element) => task.id == element.id);
      _tasks[taskIndex].title = newTitle;
      _tasks[taskIndex].createdDate = updatedDate;
      notifyListeners();
    });
  }

  Future<void> toggleFinished(Task task) async {
    final isar = await db;

    isar!.writeTxn(() async {
      task.isFinished = !task.isFinished;
      task.updatedDate = DateTime.now();
      await isar.tasks.put(task);

      int todoIndex = _tasks.indexWhere((element) => task.id == element.id);
      _tasks[todoIndex].isFinished = task.isFinished;
      _tasks[todoIndex].updatedDate = task.updatedDate;
      notifyListeners();
    });
  }

  Future<void> deleteTask(Task task) async {
    final isar = await db;
    await isar!.writeTxn(() async {
      await isar.tasks.delete(task.id);
      _tasks.remove(task);

      notifyListeners();
    });
  }
}
