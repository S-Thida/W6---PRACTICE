import 'courses_repository.dart';
import '../models/course.dart';

class CoursesMockRepository implements CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
  ];

  @override
 List<Course> getCourses(){
    return _courses;
  }

  @override
   void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
}