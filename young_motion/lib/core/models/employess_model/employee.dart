class Employee {
  int id;
  String full_name;
  double rating;
  String description;
  String avatar_url;
  String post;

  Employee(
      {required this.id,
      required this.full_name,
      required this.description,
      required this.avatar_url,
      required this.post,
      required this.rating});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      full_name: json['full_name'] ?? '',
      description: json['description'] ?? '',
      avatar_url: json['avatar_url'] ?? '',
      post: json['post']['post_name'] ?? '',
      rating: json['rating'] ?? 0.0,
    );
  }
}
