import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/widgets/task_tile.dart';
import 'package:todome_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              tastTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateData(task);
              },
              longPressedCallBack: () {
                taskData.deleteData(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
