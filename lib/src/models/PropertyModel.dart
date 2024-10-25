class PropertyModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final bool isAvailable;
  final DateTime? lastAccessDate;
  final int idUser;
  final int idPropertyType;
  final String? imageUrl;

  PropertyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isAvailable,
    this.lastAccessDate,
    required this.idUser,
    required this.idPropertyType,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'isAvailable': isAvailable,
      'lastAccessDate': lastAccessDate?.toIso8601String(),
      'idUser': idUser,
      'idPropertyType': idPropertyType,
      'imageUrl': imageUrl ?? '',
    };
  }

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      isAvailable: json['isAvailable'] ?? false,
      lastAccessDate: json['lastAccessDate'] != null ? DateTime.parse(json['lastAccessDate']) : null,
      idUser: json['idUser'] ?? 0,
      idPropertyType: json['idPropertyType'] ?? 0,
      imageUrl: json['imageUrl'],
    );
  }
}