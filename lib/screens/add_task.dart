import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/models/task_data.dart';
import 'package:todome_app/widgets/colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
