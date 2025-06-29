import 'package:flutter/material.dart';

class OilPressureWarningLightRepairIdeaScreen extends StatelessWidget {
  const OilPressureWarningLightRepairIdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oil Pressure Warning Light Repair Ideas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Repair idea(s) :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Description : An oil pump should last the life of your engine, but may become prematurely worn over time. If your vehicle's oil pressure is low even though the oil level is high, this is a sign the oil pump may need replacement.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cause : Worn Oil Pump',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solution : Dashboard Warning Diagnostic',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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