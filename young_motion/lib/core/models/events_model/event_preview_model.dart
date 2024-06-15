class EventPreviewModel {
  final int id;
  final String image_url;

  EventPreviewModel({required this.id, required this.image_url});

  factory EventPreviewModel.fromJson(Map<String, dynamic> json) {
    return EventPreviewModel(
      id: json['id'],
      image_url: json['preview_image'],
    );
  }
}
