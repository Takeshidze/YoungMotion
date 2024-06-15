import 'package:young_motion/core/models/employess_model/employee_for_lesson.dart';

class LessonDate {
  final int id;
  final DateTime datetime;
  final EmployeeForLesson employee;

  LessonDate({
    required this.id,
    required this.employee,
    required this.datetime,
  });

  factory LessonDate.fromJson(Map<String, dynamic> json) {
    return LessonDate(
      id: json['id'],
      datetime: DateTime.parse(json['datetime']),
      employee: EmployeeForLesson.fromJson(json['employee']),
    );
  }
}
