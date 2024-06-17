import 'package:young_motion/core/models/employess_model/employee_for_lesson.dart';

class LessonDateModel {
  final int id;
  final DateTime datetime;
  final EmployeeForLesson employee;

  LessonDateModel({
    required this.id,
    required this.employee,
    required this.datetime,
  });

  factory LessonDateModel.fromJson(Map<String, dynamic> json) {
    return LessonDateModel(
      id: json['id'],
      datetime: DateTime.parse(json['datetime']),
      employee: EmployeeForLesson.fromJson(json['event']['employee']),
    );
  }
}
