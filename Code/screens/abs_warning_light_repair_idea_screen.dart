import 'package:flutter/material.dart';

class AbsWarningLightRepairIdeaScreen extends StatelessWidget {
  const AbsWarningLightRepairIdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABS Warning Light Repair Ideas'),
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
            Text(
              "Description : If there is a fault in the ABS system, the vehicle will still brake, however there may be a loss of power-assist. This situation is very unsafe, and the faulty ABS syatem should be repaired immediately.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Cause : ABS System Fault",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Solution : Dashboard Warning Diagnostic",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Description : If your vehicle's Brake Warning Light is on and your emergency brake is released, your brakes may have lost pressure. Your vehicle is dangerous if the brakes are not working properly. It is important to check brake pressure when your Brake Warning Light comes on.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Cause : Loss of Brake Pressure",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Solution : Dashboard Warning Diagnostic",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
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