import 'package:w6_practice/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
List<Course> getCourses();
void addScore(Course course, CourseScore score);
}