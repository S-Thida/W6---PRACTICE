import 'package:w6_practice/EX-1-START-CODE/Repositories/courses_repository.dart';
import 'package:w6_practice/EX-1-START-CODE/models/course.dart';
import 'package:flutter/material.dart';



class CoursesProvider with ChangeNotifier {
  final CoursesRepository _repository;
  List<Course> _courses = [];

  CoursesProvider({required CoursesRepository repository})
      : _repository = repository {
    _courses = _repository.getCourses(); // Initialize courses list
  }

  List<Course> get courses => _courses;

  void addScore(String courseId, CourseScore score) {
    Course course =
        _courses.firstWhere((c) => c.name == courseId, orElse: () => throw Exception('Course not found'));
    _repository.addScore(course, score); // Pass Course object instead of name
    notifyListeners();
  }
}

