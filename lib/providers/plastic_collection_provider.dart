import 'package:flutter/material.dart';
import '../models/plastic_collection.dart';

class PlasticCollectionProvider extends ChangeNotifier {
  final List<PlasticCollection> _collections = [];
  bool _isLoading = false;
  String _error = '';

  List<PlasticCollection> get collections => [..._collections];
  bool get isLoading => _isLoading;
  String get error => _error;

  // Get total weight of collected plastic
  double get totalCollectedWeight {
    return _collections.fold(0, (sum, collection) => sum + collection.weightKg);
  }

  // Get collections by type
  Map<String, double> get collectionsByType {
    final Map<String, double> result = {};
    for (var collection in _collections) {
      if (result.containsKey(collection.plasticType)) {
        result[collection.plasticType] = result[collection.plasticType]! + collection.weightKg;
      } else {
        result[collection.plasticType] = collection.weightKg;
      }
    }
    return result;
  }

  // Fetch collections from API or local storage
  Future<void> fetchCollections() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      // For demo purposes, we'll add some sample data
      await Future.delayed(const Duration(seconds: 1));
      
      _collections.clear();
      _collections.addAll([
        PlasticCollection(
          id: '1',
          userId: 'user123',
          plasticType: 'PET',
          weightKg: 5.2,
          location: 'Kochi, Kerala',
          collectionDate: DateTime.now().subtract(const Duration(days: 5)),
          imageUrl: 'https://example.com/plastic1.jpg',
        ),
        PlasticCollection(
          id: '2',
          userId: 'user123',
          plasticType: 'HDPE',
          weightKg: 3.7,
          location: 'Kochi, Kerala',
          collectionDate: DateTime.now().subtract(const Duration(days: 3)),
          imageUrl: 'https://example.com/plastic2.jpg',
        ),
        PlasticCollection(
          id: '3',
          userId: 'user123',
          plasticType: 'LDPE',
          weightKg: 2.1,
          location: 'Kochi, Kerala',
          collectionDate: DateTime.now().subtract(const Duration(days: 1)),
          imageUrl: 'https://example.com/plastic3.jpg',
        ),
      ]);
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to fetch collections: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new plastic collection
  Future<bool> addCollection(PlasticCollection collection) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      await Future.delayed(const Duration(seconds: 1));
      
      final newCollection = PlasticCollection(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: collection.userId,
        plasticType: collection.plasticType,
        weightKg: collection.weightKg,
        location: collection.location,
        collectionDate: collection.collectionDate,
        imageUrl: collection.imageUrl,
      );
      
      _collections.add(newCollection);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to add collection: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Delete a plastic collection
  Future<bool> deleteCollection(String id) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // In a real app, this would make an API call
      await Future.delayed(const Duration(seconds: 1));
      
      _collections.removeWhere((collection) => collection.id == id);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to delete collection: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
} 