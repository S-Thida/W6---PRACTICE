import 'package:flutter/material.dart';
import 'package:w6_practice/EX-1-START-CODE/Repositories/courses_mock_repository.dart';
import 'package:provider/provider.dart';
import 'providers/courses_provider.dart';
import 'screens/course_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CoursesProvider(repository: CoursesMockRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}