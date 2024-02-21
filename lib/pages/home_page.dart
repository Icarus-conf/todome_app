import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/components/text_format.dart';
import 'package:todome_app/models/task.dart';
import 'package:todome_app/provider/todome_database_provider.dart';
import 'package:todome_app/widgets/add_task.dart';
import 'package:todome_app/widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TodomeDatabase>(context).tasks;
    return Scaffold(
      backgroundColor: const Color(0xFF3c6e71),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PoppinsText(
                    text: 'TodoME',
                    color: Colors.white,
                    fontS: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  PoppinsText(
                    text: 'You have ${tasks.length} Tasks',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFedf6f9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Consumer<TodomeDatabase>(
                  builder: (context, value, child) {
                    return value.tasks.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.all(20),
                            itemCount: value.tasks.length,
                            itemBuilder: (context, index) {
                              return TaskItem(
                                value.tasks.reversed.toList()[index],
                              );
                            },
                          )
                        : const Center(
                            child: PoppinsText(
                              text: 'No tasks yet!',
                              fontS: 18,
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3c6e71),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask(
                      text: 'Add task',
                      controller: titleController,
                      onPressed: () {
                        if (titleController.text.isNotEmpty) {
                          Task task = Task()
                            ..title = titleController.text
                            ..isFinished = false
                            ..createdDate = DateTime.now();
                          Provider.of<TodomeDatabase>(context, listen: false)
                              .addTask(task);

                          titleController.clear();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  )));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
