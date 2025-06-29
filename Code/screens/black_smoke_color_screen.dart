import 'package:flutter/material.dart';

class BlackSmokeScreen extends StatelessWidget {
  const BlackSmokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Smoke Repair Ideas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Repair idea(s) :',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description : Black smoke may mean your engine is burning too much fuel or that your fuel return line is clogged. It is important to check your sensors, fuel injectors, and fuel-pressure regulator. To fix the issue and gain better fuel economy, be sure to have your vehicle repaired by an expert.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cause : Engine is Burning Too Much Fuel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solution : Engine Diagnostics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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

class SmokeColorScreen extends StatelessWidget {
  const SmokeColorScreen({super.key});

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
              'What color is the smoke?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildOption(context, 'Black'),
            _buildOption(context, 'White'),
            _buildOption(context, 'Blue'),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: const Icon(
          Icons.build,
          color: Colors.orange,
        ),
        title: Text(
          color,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          if (color == 'Black') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlackSmokeScreen(),
              ),
            );
          } else if (color == 'White') {
            // Navigate to White Smoke Screen
          } else if (color == 'Blue') {
            // Navigate to Blue Smoke Screen
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SmokeColorScreen(),
  ));
}