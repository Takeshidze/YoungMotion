class Employee {
  final int id;
  final String fullName;
  final String littleDescription;
  final String bigDescription;
  final double rating;
  final String avatarUrl;
  Employee(
      {required this.id,
      required this.fullName,
      required this.littleDescription,
      required this.bigDescription,
      required this.rating,
      required this.avatarUrl});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      fullName: json['full_name'],
      avatarUrl: json['avatar_url'],
      bigDescription: json['big_description'],
      littleDescription: json['little_description'],
      rating: json['rating'],
    );
  }
}
