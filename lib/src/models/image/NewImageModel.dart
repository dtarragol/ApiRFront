import 'dart:typed_data';

class NewImage {
  final int propertyId;
  final Uint8List? Image;


  NewImage({
    required this.propertyId,
    required this.Image,
  });

  Map<String, String> toJson() {
    return {
      'propertyId': propertyId.toString(),
      'Image': Image.toString(),
    };
  }

  factory NewImage.fromJson(Map<String, dynamic> json) {
    return NewImage(
      propertyId: json['propertyId'] ?? 0,
      Image: json['Image'] ?? '',
    );
  }
}