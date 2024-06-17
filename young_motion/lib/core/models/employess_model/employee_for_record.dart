class EmployeeForRecord {
  final int id;
  final String fullName;
  final String avatarUrl;
  final String post;

  EmployeeForRecord({
    required this.id,
    required this.fullName,
    required this.avatarUrl,
    required this.post,
  });

  factory EmployeeForRecord.fromJson(Map<String, dynamic> json) {
    return EmployeeForRecord(
      id: json['id'],
      fullName: json['full_name'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      post: json['post']['post_name'] ?? '',
    );
  }
}
