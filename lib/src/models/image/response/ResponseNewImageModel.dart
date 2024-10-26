class NewImageResponse {
  final int id;
  final int position;
  final String url;
  final int propertyId;
  final String propertyName;

  NewImageResponse({
    required this.id,
    required this.position,
    required this.url,
    required this.propertyId,
    required this.propertyName,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
      'url': url,
      'propertyId': propertyId,
      'propertyName': propertyName,
    };
  }

  factory NewImageResponse.fromJson(Map<String, dynamic> json) {
    return NewImageResponse(
      id: json['id'] ?? 0,
      position: json['position'] ?? 0,
      url: json['url'] ?? '',
      propertyId: json['propertyId'] ?? 0,
      propertyName: json['propertyName'] ?? '',
    );
  }
}