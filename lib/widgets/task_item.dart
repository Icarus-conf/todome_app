import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/components/text_format.dart';
import 'package:todome_app/models/task.dart';
import 'package:todome_app/provider/todome_database_provider.dart';
import 'package:todome_app/widgets/add_task.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task, {super.key});
  final Task task;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TodomeDatabase>(context, listen: false)
            .toggleFinished(task);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          color: Color(0xFF3c6e71),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF3c6e71),
              offset: Offset(0, 0.5),
              blurRadius: 1,
            )
          ],
        ),
        child: Slidable(
          startActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                Provider.of<TodomeDatabase>(context, listen: false)
                    .deleteTask(task);
              },
              label: "Delete",
              icon: Icons.delete_forever_rounded,
              backgroundColor: const Color(0xFFe01e37),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                      child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: AddTask(
                                      text: 'Update your task',
                                      controller: controller,
                                      onPressed: () {
                                        if (controller.text.isNotEmpty) {
                                          DateTime currentTime = DateTime.now();

                                          Provider.of<TodomeDatabase>(context,
                                                  listen: false)
                                              .updateTask(task, controller.text,
                                                  currentTime);

                                          controller.clear();
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  )));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: const VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: PoppinsText(
                            color: Colors.white,
                            text: task.title.trim(),
                            fontWeight: FontWeight.w600,
                            textDecoration: task.isFinished
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PoppinsText(
                          text:
                              DateFormat.yMEd().add_jm().format(DateTime.now()),
                          fontS: 10,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                    visible: task.isFinished ? true : false,
                    child: Image.asset(
                      'assets/images/check.png',
                      width: MediaQuery.of(context).size.height * 0.04,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
