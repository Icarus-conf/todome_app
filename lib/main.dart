import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todome_app/provider/todome_database_provider.dart';
import 'package:todome_app/pages/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodomeDatabase(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
