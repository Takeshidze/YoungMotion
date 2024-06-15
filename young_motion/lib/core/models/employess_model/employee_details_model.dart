import 'package:young_motion/core/models/review_model.dart';

import 'employee.dart';

class EmployeeDetailsModel {
  Employee employee;
  List<ReviewModel> reviews;

  EmployeeDetailsModel({
    required this.employee,
    required this.reviews,
  });

  factory EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    return EmployeeDetailsModel(
        employee: Employee.fromJson(json),
        reviews: (json['reviews'] as List)
            .map((commentJson) => ReviewModel.fromJson(commentJson))
            .toList());
  }
}
