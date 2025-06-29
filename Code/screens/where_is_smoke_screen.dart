import 'package:flutter/material.dart';
import 'repair_idea_screen.dart';
import 'smoke_color_screen.dart'; // Import your SmokeColorScreen

class WhereIsSmokeScreen extends StatelessWidget {
  const WhereIsSmokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Diagnostic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Where in the vehicle is the smoke coming from?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildOption(context, 'Engine Compartment'),
            _buildOption(context, 'Exhaust'), // This option will now navigate to SmokeColorScreen
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String text) {
    return ListTile(
      leading: const Icon(Icons.build), // Wrench/screwdriver icon
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (text == 'Engine Compartment') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RepairIdeaScreen(),
            ),
          );
        } else if (text == 'Exhaust') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SmokeColorScreen(),
            ),
          );
        } else {
          // Placeholder for any other options that might be added later
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No repair info available for "$text" yet')),
          );
        }
      },
    );
  }

  // The _buildSmokeColorOption method is removed as requested.
}