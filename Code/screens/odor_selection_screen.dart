import 'package:flutter/material.dart';

class OdorSelectionScreen extends StatelessWidget {
  const OdorSelectionScreen({super.key});

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
              'What odor do you smell?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DiagnosticOption(text: 'Gasoline'),
                  DiagnosticOption(text: 'Rotten eggs'),
                  DiagnosticOption(text: 'Mildew'),
                  DiagnosticOption(text: 'Antifreeze (sweet smell)'),
                  DiagnosticOption(text: 'Burning oil'),
                  DiagnosticOption(text: 'Exhaust'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiagnosticOption extends StatelessWidget {
  const DiagnosticOption({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.build, color: Colors.orange), // Wrench icon
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios), // Right arrow icon
          ],
        ),
      ),
    );
  }
}