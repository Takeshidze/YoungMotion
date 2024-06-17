import 'package:young_motion/core/models/employess_model/employee_for_lesson.dart';
import 'package:young_motion/core/models/employess_model/employee_for_record.dart';

class RecordModel {
  final int id;
  final String event_name;
  final DateTime datetime;
  final EmployeeForRecord employee;

  RecordModel({
    required this.id,
    required this.event_name,
    required this.employee,
    required this.datetime,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      id: json['id'],
      datetime: DateTime.parse(json['lesson']['datetime']),
      employee: EmployeeForRecord.fromJson(json['lesson']['event']['employee']),
      event_name: json['lesson']['event']['event_name'],
    );
  }
}
