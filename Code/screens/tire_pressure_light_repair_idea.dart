import 'package:flutter/material.dart';

class TirePressureLightRepairIdeasScreen extends StatelessWidget {
  const TirePressureLightRepairIdeasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tire Pressure Repair Ideas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Repair idea(s) :',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Description : Tire pressure plays an important role in vehicle performance. If your tire pressure is uneven or low, the vehicle may handle poorly and will lose fuel economy. If the tires are overinflated, the vehicle will not ride smoothly. Both underinflated and overinflated tires contribute to prematurely worn tires. Environmental factors such as temperature change may affect tire pressure, as well. Make sure to check tire pressure regularly.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Cause : Incorrect Tire Pressure',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Solution : Dashboard Warning Diagnostic',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(), // Pushes the OK button to the bottom
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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