import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_practice/EX-1-START-CODE/providers/courses_provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  void _addScore(BuildContext context) async {
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newScore != null) {
      Provider.of<CoursesProvider>(context, listen: false)
          .addScore(course.name, newScore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (ctx, coursesProvider, child) {
        final updatedCourse = coursesProvider.courses.firstWhere((c) => c.name == course.name);

        return Scaffold(
          appBar: AppBar(title: Text(updatedCourse.name)),
          body: updatedCourse.scores.isEmpty
              ? const Center(child: Text('No Scores added yet.'))
              : ListView.builder(
                  itemCount: updatedCourse.scores.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(updatedCourse.scores[index].studentName),
                    trailing: Text(
                      updatedCourse.scores[index].studenScore.toString(),
                      style: TextStyle(
                        color: updatedCourse.scores[index].studenScore > 50 ? Colors.green : Colors.orange,
                      ),
                    ),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addScore(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

