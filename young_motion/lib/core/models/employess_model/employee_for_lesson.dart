class EmployeeForLesson {
  final int id;
  final String fullName;
  final String avatarUrl;

  EmployeeForLesson(
      {required this.id, required this.fullName, required this.avatarUrl});

  factory EmployeeForLesson.fromJson(Map<String, dynamic> json) {
    return EmployeeForLesson(
      id: json['id'],
      fullName: json['full_name'],
      avatarUrl: json['avatar_url'],
    );
  }
}
