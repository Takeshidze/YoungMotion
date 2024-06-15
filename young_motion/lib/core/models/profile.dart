class ProfileModel {
  final String avatarUrl;
  final String first_name;
  final String second_name;

  ProfileModel(
      {required this.avatarUrl,
      required this.first_name,
      required this.second_name});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      avatarUrl: json['avatar_url'],
      first_name: json['first_name'],
      second_name: json['second_name'],
    );
  }
}
