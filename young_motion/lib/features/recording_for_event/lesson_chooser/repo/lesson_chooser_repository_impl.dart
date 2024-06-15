import 'package:http/http.dart' as http;

import 'package:young_motion/core/models/employess_model/employee_for_lesson.dart';
import 'dart:convert';

import 'package:young_motion/core/models/lesson_date.dart';

import 'lesson_chooser_repository.dart';

class LessonChooserRepositoryImpl implements LessonChooserRepository {
  @override
  Future<List<LessonDate>> getLessons() async {
    final response = await http.get(Uri.parse('https://your-api.com/lessons'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((json) => LessonDate.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}

class LessonChooserRepositoryImplMock implements LessonChooserRepository {
  @override
  Future<List<LessonDate>> getLessons() async {
    return [
      LessonDate(
        id: 1,
        datetime: DateTime.now(),
        employee: EmployeeForLesson(
          id: 1,
          fullName: 'Иван Иванов',
          avatarUrl: 'https://your-api.com/avatars/1.jpg',
        ),
      ),
      LessonDate(
        id: 2,
        datetime: DateTime.now().add(Duration(days: 1)),
        employee: EmployeeForLesson(
          id: 2,
          fullName: 'Мария Петрова',
          avatarUrl: 'https://your-api.com/avatars/2.jpg',
        ),
      ),
      LessonDate(
        id: 3,
        datetime: DateTime.now().add(Duration(days: 2)),
        employee: EmployeeForLesson(
          id: 3,
          fullName: 'Пётр Сидоров',
          avatarUrl: 'https://your-api.com/avatars/3.jpg',
        ),
      ),
    ];
  }
}
