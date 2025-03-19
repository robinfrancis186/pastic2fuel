class FuelProduction {
  final String id;
  final String userId;
  final String fuelType;
  final double volumeLiters;
  final double plasticUsedKg;
  final DateTime productionDate;
  final String facilityName;

  FuelProduction({
    required this.id,
    required this.userId,
    required this.fuelType,
    required this.volumeLiters,
    required this.plasticUsedKg,
    required this.productionDate,
    required this.facilityName,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'fuelType': fuelType,
      'volumeLiters': volumeLiters,
      'plasticUsedKg': plasticUsedKg,
      'productionDate': productionDate.toIso8601String(),
      'facilityName': facilityName,
    };
  }

  // Create from JSON
  factory FuelProduction.fromJson(Map<String, dynamic> json) {
    return FuelProduction(
      id: json['id'],
      userId: json['userId'],
      fuelType: json['fuelType'],
      volumeLiters: json['volumeLiters'].toDouble(),
      plasticUsedKg: json['plasticUsedKg'].toDouble(),
      productionDate: DateTime.parse(json['productionDate']),
      facilityName: json['facilityName'],
    );
  }
} 