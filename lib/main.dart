import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/models/task_data.dart';
import 'package:todome_app/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
