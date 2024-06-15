import 'package:young_motion/core/models/profile.dart';

class ReviewModel {
  int id;
  ProfileModel user;
  int stars;
  String description;
  DateTime created_at;

  ReviewModel({
    required this.id,
    required this.user,
    required this.description,
    required this.stars,
    required this.created_at,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      user: ProfileModel.fromJson(json['user']),
      description: json['description'] ?? '',
      stars: json['stars'] ?? '',
      created_at: json['created_at'] ?? '',
    );
  }
}
