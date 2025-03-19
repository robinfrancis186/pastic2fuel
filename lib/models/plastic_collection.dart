class PlasticCollection {
  final String id;
  final String userId;
  final String plasticType;
  final double weightKg;
  final String location;
  final DateTime collectionDate;
  final String imageUrl;

  PlasticCollection({
    required this.id,
    required this.userId,
    required this.plasticType,
    required this.weightKg,
    required this.location,
    required this.collectionDate,
    required this.imageUrl,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'plasticType': plasticType,
      'weightKg': weightKg,
      'location': location,
      'collectionDate': collectionDate.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }

  // Create from JSON
  factory PlasticCollection.fromJson(Map<String, dynamic> json) {
    return PlasticCollection(
      id: json['id'],
      userId: json['userId'],
      plasticType: json['plasticType'],
      weightKg: json['weightKg'].toDouble(),
      location: json['location'],
      collectionDate: DateTime.parse(json['collectionDate']),
      imageUrl: json['imageUrl'],
    );
  }
} 