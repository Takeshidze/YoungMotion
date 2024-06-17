class EventNewsModal {
  final int id;
  final String image_url;
  final String title;

  EventNewsModal(
      {required this.id, required this.image_url, required this.title});

  factory EventNewsModal.fromJson(Map<String, dynamic> json) {
    return EventNewsModal(
      id: json['id'],
      image_url: json['preview_image'],
      title: json['event_name'],
    );
  }
}
