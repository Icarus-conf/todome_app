import 'package:isar/isar.dart';

part 'task.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement;
  late String title;
  late bool isFinished;
  DateTime? createdDate;
  DateTime? updatedDate;
}
