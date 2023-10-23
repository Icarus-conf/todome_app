import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:todome_app/models/task_data.dart';
import 'package:todome_app/screens/add_task.dart';
import 'package:todome_app/widgets/colors.dart';
import 'package:todome_app/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTaskScreen(),
                  )));
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Todome',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
