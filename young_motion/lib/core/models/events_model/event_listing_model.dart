class EventListingModel {
  final int id;
  final String event_name;
  final String logo_image;
  final String duration;
  final String employee;
  final String age_restricrion;

  EventListingModel({
    required this.id,
    required this.event_name,
    required this.logo_image,
    required this.duration,
    required this.employee,
    required this.age_restricrion,
  });

  factory EventListingModel.fromJson(Map<String, dynamic> json) {
    return EventListingModel(
      id: json['id'],
      logo_image: json['logo_image'] ?? '',
      event_name: json['event_name'] ?? '',
      duration: json['duration'] ?? '',
      employee: json['employee']['full_name'] ?? '',
      age_restricrion: json['age_restricrion'] ?? '',
    );
  }
}
