import 'package:young_motion/core/models/employess_model/employee_for_lesson.dart';
import 'package:young_motion/core/models/lesson_date_model.dart';
import 'package:young_motion/core/models/person.dart';

class FormDataModel {
  String user_id;
  String name;
  String surname;
  String email;
  String phone;
  Gender gender;
  int lesson_id;

  FormDataModel({
    required this.user_id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.lesson_id,
  });
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'first_name': name,
      'second_name': surname,
      'email': email,
      'phone': phone,
      'gender': gender.toString().split('.').last,
      'lesson_id': lesson_id // преобразуем enum в строку
    };
  }
}
