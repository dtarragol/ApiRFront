class ApartmentModel {
  final int id;
  final double indoorSquareMeters;
  final double totalSquareMeters;
  final int bedrooms;
  final int bathrooms;
  final bool hasGarage;
  final bool hasTerrace;
  final bool hasBalcony;
  final bool hasGarden;
  final int floor;
  final bool isAnAtic;
  final int propertyId;
  final String name;
  final String description;
  final double price;
  final bool isAvailable;
  final DateTime? lastAccessDate;
  final int idUser;
  final int idPropertyType;
  final String? imageUrl;

  ApartmentModel({
    required this.id,
    required this.indoorSquareMeters,
    required this.totalSquareMeters,
    required this.bedrooms,
    required this.bathrooms,
    required this.hasGarage,
    required this.hasTerrace,
    required this.hasBalcony,
    required this.hasGarden,
    required this.floor,
    required this.isAnAtic,
    required this.propertyId,
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
      'indoorSquareMeters': indoorSquareMeters,
      'totalSquareMeters': totalSquareMeters,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'hasGarage': hasGarage,
      'hasTerrace': hasTerrace,
      'hasBalcony': hasBalcony,
      'hasGarden': hasGarden,
      'floor': floor,
      'isAnAtic': isAnAtic,
      'propertyId': propertyId,
    };
  }

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      isAvailable: json['isAvailable'] ?? false,
      lastAccessDate: json['lastAccessDate'] != null ? DateTime.parse(json['lastAccessDate']) : null,
      idUser: json['idUser'] ?? 0,
      idPropertyType: json['idPropertyType'] ?? 0,
      imageUrl: json['imageUrl'],
      indoorSquareMeters: (json['indoorSquareMeters'] ?? 0).toDouble(),
      totalSquareMeters: (json['totalSquareMeters'] ?? 0).toDouble(),
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      hasGarage: json['hasGarage'] ?? false,
      hasTerrace: json['hasTerrace'] ?? false,
      hasBalcony: json['hasBalcony'] ?? false,
      hasGarden: json['hasGarden'] ?? false,
      floor: json['floor'] ?? 0,
      isAnAtic: json['isAnAtic'] ?? false,
      propertyId: json['propertyId'] ?? 0,
    );
  }
}