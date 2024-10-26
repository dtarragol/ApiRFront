class ImageModel {
  final int id;
  final int position;
  final String url;
  final int propertyId;

  ImageModel({
    required this.id,
    required this.position,
    required this.url,
    required this.propertyId,
  });

  Map<String, String> toJson() {
    return {
      'id': id.toString(),
      'position': position.toString(),
      'url': url,
      'propertyId': propertyId.toString(),
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0,
      position: json['position'] ?? 0,
      url: json['url'] ?? '',
      propertyId: json['propertyId'] ?? 0,
    );
  }
}