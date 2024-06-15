import 'package:young_motion/core/models/employess_model/employee.dart';

class EventDetailModel {
  final int id;
  final String event_name;
  final String description;
  final List<String> images;
  final String duration;
  final Employee employee;
  final int age_restricrion;

  EventDetailModel({
    required this.id,
    required this.event_name,
    required this.duration,
    required this.employee,
    required this.age_restricrion,
    required this.description,
    required this.images,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) {
    return EventDetailModel(
      id: json['id'],
      images: json['images'] ?? [],
      event_name: json['event_name'] ?? '',
      duration: json['duration'] ?? '',
      employee: Employee.fromJson(json['employees']),
      age_restricrion: json['age_restriction'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
