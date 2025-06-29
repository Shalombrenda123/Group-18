import 'package:flutter/material.dart';

class BlueSmokeColorScreen extends StatelessWidget {
  const BlueSmokeColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Smoke Repair Ideas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Repair Idea(s):',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Blue-colored smoke comes out of the exhaust pipe, especially during acceleration or startup.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cause:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Engine oil is entering the combustion chamber and burning along with fuel. This can be due to:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('Worn piston rings', style: TextStyle(fontSize: 16)),
            const Text('Damaged valve seals or guides', style: TextStyle(fontSize: 16)),
            const Text('Faulty turbocharger', style: TextStyle(fontSize: 16)),
            const Text('PCV (Positive Crankcase Ventilation) system failure', style: TextStyle(fontSize: 16)),
            const Text('Cylinder wall damage', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Solution:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Replace worn piston rings or rebore engine if cylinder walls are damaged', style: TextStyle(fontSize: 16)),
            const Text('Replace valve seals/guides', style: TextStyle(fontSize: 16)),
            const Text('Repair or replace turbocharger if faulty', style: TextStyle(fontSize: 16)),
            const Text('Clean or replace PCV valve/system', style: TextStyle(fontSize: 16)),
            const Text('Perform compression and leak-down tests to diagnose source of oil', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}