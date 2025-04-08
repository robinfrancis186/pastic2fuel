import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/plastic_collection_provider.dart';
import '../models/plastic_collection.dart';

class PlasticCollectionList extends StatelessWidget {
  const PlasticCollectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlasticCollectionProvider>(
      builder: (context, provider, child) {
        final collections = provider.collections;

        if (collections.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.recycling,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                const Text(
                  'No Collections Yet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start by adding your first plastic collection',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/plastic-collection');
                  },
                  child: const Text('Add Collection'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final collection = collections[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  child: Icon(
                    Icons.recycling,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text('${collection.weightKg.toStringAsFixed(1)} kg'),
                subtitle: Text(
                  'Type: ${collection.plasticType}\nDate: ${_formatDate(collection.collectionDate)}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    _showDeleteConfirmation(context, provider, collection);
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
    PlasticCollectionProvider provider,
    PlasticCollection collection,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Collection'),
        content: const Text('Are you sure you want to delete this collection?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.deleteCollection(collection.id);
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