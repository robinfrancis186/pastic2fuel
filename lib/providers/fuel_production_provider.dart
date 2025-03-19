import 'package:flutter/material.dart';
import '../models/fuel_production.dart';

class FuelProductionProvider extends ChangeNotifier {
  final List<FuelProduction> _productions = [];
  bool _isLoading = false;
  String _error = '';

  List<FuelProduction> get productions => [..._productions];
  bool get isLoading => _isLoading;
  String get error => _error;

  // Get total volume of produced fuel
  double get totalProducedVolume {
    return _productions.fold(0, (sum, production) => sum + production.volumeLiters);
  }

  // Get productions by fuel type
  Map<String, double> get productionsByFuelType {
    final Map<String, double> result = {};
    for (var production in _productions) {
      if (result.containsKey(production.fuelType)) {
        result[production.fuelType] = result[production.fuelType]! + production.volumeLiters;
      } else {
        result[production.fuelType] = production.volumeLiters;
      }
    }
    return result;
  }

  // Fetch productions from API or local storage
  Future<void> fetchProductions() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      // For demo purposes, we'll add some sample data
      await Future.delayed(const Duration(seconds: 1));
      
      _productions.clear();
      _productions.addAll([
        FuelProduction(
          id: '1',
          userId: 'user123',
          fuelType: 'Diesel',
          volumeLiters: 12.5,
          plasticUsedKg: 25.0,
          productionDate: DateTime.now().subtract(const Duration(days: 10)),
          facilityName: 'Kochi Conversion Plant',
        ),
        FuelProduction(
          id: '2',
          userId: 'user123',
          fuelType: 'Gasoline',
          volumeLiters: 8.3,
          plasticUsedKg: 18.5,
          productionDate: DateTime.now().subtract(const Duration(days: 7)),
          facilityName: 'Kochi Conversion Plant',
        ),
        FuelProduction(
          id: '3',
          userId: 'user123',
          fuelType: 'Kerosene',
          volumeLiters: 5.7,
          plasticUsedKg: 12.0,
          productionDate: DateTime.now().subtract(const Duration(days: 3)),
          facilityName: 'Kochi Conversion Plant',
        ),
      ]);
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to fetch productions: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new fuel production
  Future<bool> addProduction(FuelProduction production) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      await Future.delayed(const Duration(seconds: 1));
      
      final newProduction = FuelProduction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: production.userId,
        fuelType: production.fuelType,
        volumeLiters: production.volumeLiters,
        plasticUsedKg: production.plasticUsedKg,
        productionDate: production.productionDate,
        facilityName: production.facilityName,
      );
      
      _productions.add(newProduction);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to add production: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Delete a fuel production
  Future<bool> deleteProduction(String id) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      await Future.delayed(const Duration(seconds: 1));
      
      _productions.removeWhere((production) => production.id == id);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to delete production: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
} 