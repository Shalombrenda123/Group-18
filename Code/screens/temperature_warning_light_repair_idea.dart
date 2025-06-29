import 'package:flutter/material.dart';

class TemperatureWarningLightRepairIdea extends StatelessWidget {
  const TemperatureWarningLightRepairIdea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Warning Light Repair Ideas'),
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
              "Description : Your vehicle's thermostat controls the amount of coolant released to the engine. If the thermostat is stuck closed, your vehicle will not receive the proper amount of coolant it needs, and may overheat. It is necessary to replace a stuck thermostat immediately.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cause : Stuck Thermostat',
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