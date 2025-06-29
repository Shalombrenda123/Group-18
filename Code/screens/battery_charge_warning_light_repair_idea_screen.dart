import 'package:flutter/material.dart';

class BatteryChargeWarningLightRepairIdeaScreen extends StatelessWidget {
  const BatteryChargeWarningLightRepairIdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Charge Warning Light Repair Ideas'),
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
              "Description : The serpentine belt helps run the motors and pumps that make sure your vehicle is running smoothly. It is important to replace a damaged or loose serpentine belt, as it may cause your vehicle to stall, steering to tighten up, or your vehicle to overheat.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cause : Serpentine Belt Slipping/ Damaged',
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