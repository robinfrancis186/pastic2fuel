import 'package:flutter/material.dart';

class EducationalContentScreen extends StatelessWidget {
  const EducationalContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn About Plastic to Fuel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'What is Plastic to Fuel Conversion?',
              content: 'Plastic to fuel conversion is a process that transforms plastic waste into usable fuel through pyrolysis. This process helps reduce plastic pollution while creating valuable energy resources.',
              icon: Icons.science,
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: 'Types of Plastic We Accept',
              content: '''
• PET (Polyethylene Terephthalate)
• HDPE (High-Density Polyethylene)
• LDPE (Low-Density Polyethylene)
• PP (Polypropylene)''',
              icon: Icons.category,
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: 'The Conversion Process',
              content: '''
1. Collection & Sorting
2. Cleaning & Shredding
3. Pyrolysis
4. Condensation
5. Distillation
6. Quality Control''',
              icon: Icons.recycling,
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: 'Environmental Impact',
              content: '''
• Reduces plastic waste in landfills
• Decreases ocean pollution
• Provides alternative fuel source
• Lowers carbon footprint''',
              icon: Icons.eco,
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: 'How You Can Help',
              content: '''
1. Collect and segregate plastic waste
2. Bring plastic to collection centers
3. Spread awareness
4. Track your contributions
5. Encourage others to participate''',
              icon: Icons.volunteer_activism,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF00A86B).withOpacity(0.2),
                  child: Icon(icon, color: const Color(0xFF00A86B)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 