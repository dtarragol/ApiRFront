class PropertyModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final bool isAvailable;
  final DateTime lastAccessDate;
  final int idUser;
  final int idPropertyType;
  final String? imageUrl;

  PropertyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.lastAccessDate,
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
      'lastAccessDate': lastAccessDate.toIso8601String(),
      'idUser': idUser,
      'idPropertyType': idPropertyType,
      'imageUrl': imageUrl ?? '',
    };
  }

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      isAvailable: json['isAvailable'],
      lastAccessDate: DateTime.parse(json['lastAccessDate']),
      idUser: json['idUser'],
      idPropertyType: json['idPropertyType'],
      //imageUrl: (json['images'] as List).isNotEmpty ? json['images'][0] : null,
    );
  }
}