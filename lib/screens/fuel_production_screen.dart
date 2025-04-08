import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/fuel_production_provider.dart';
import '../models/fuel_production.dart';

class FuelProductionScreen extends StatefulWidget {
  const FuelProductionScreen({super.key});

  @override
  State<FuelProductionScreen> createState() => _FuelProductionScreenState();
}

class _FuelProductionScreenState extends State<FuelProductionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fuelTypeController = TextEditingController();
  final _volumeController = TextEditingController();
  final _plasticUsedController = TextEditingController();
  final _facilityController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _fuelTypeController.dispose();
    _volumeController.dispose();
    _plasticUsedController.dispose();
    _facilityController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final provider = Provider.of<FuelProductionProvider>(context, listen: false);
      final success = await provider.addProduction(
        FuelProduction(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userId: 'user123', // Replace with actual user ID
          fuelType: _fuelTypeController.text,
          volumeLiters: double.parse(_volumeController.text),
          plasticUsedKg: double.parse(_plasticUsedController.text),
          productionDate: DateTime.now(),
          facilityName: _facilityController.text,
        ),
      );

      if (success && mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fuel production added successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fuel Production'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fuelTypeController,
                decoration: const InputDecoration(
                  labelText: 'Fuel Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the fuel type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _volumeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Volume (Liters)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the volume';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _plasticUsedController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Plastic Used (kg)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount of plastic used';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _facilityController,
                decoration: const InputDecoration(
                  labelText: 'Facility Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the facility name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Add Production'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
