import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/fuel_production_provider.dart';
import '../models/fuel_production.dart';

class FuelProductionList extends StatelessWidget {
  const FuelProductionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FuelProductionProvider>(
      builder: (context, provider, child) {
        final productions = provider.productions;

        if (productions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_gas_station,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                const Text(
                  'No Productions Yet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start by adding your first fuel production',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fuel-production');
                  },
                  child: const Text('Add Production'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: productions.length,
          itemBuilder: (context, index) {
            final production = productions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  child: Icon(
                    Icons.local_gas_station,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text('${production.volumeLiters.toStringAsFixed(1)} L'),
                subtitle: Text(
                  'Type: ${production.fuelType}\nPlastic Used: ${production.plasticUsedKg.toStringAsFixed(1)} kg\nDate: ${_formatDate(production.productionDate)}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    _showDeleteConfirmation(context, provider, production);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showDeleteConfirmation(
    BuildContext context,
    FuelProductionProvider provider,
    FuelProduction production,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Production'),
        content: const Text('Are you sure you want to delete this production record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.deleteProduction(production.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
} 