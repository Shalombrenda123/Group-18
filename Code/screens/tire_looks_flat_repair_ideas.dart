import 'package:flutter/material.dart';

class TireLooksFlatRepairIdeas extends StatelessWidget {
  const TireLooksFlatRepairIdeas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Ideas'),
      ),
      body: SingleChildScrollView(
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
              'Description : A flat tire can happen at any time, Knowing how to change your tire and keeping a regular check on your spare, checking the pressure and quality of the spare, can wind up saving you time, money, and aggravation. Keeping a tire plug kit in your vehicle is also a good way to be prepared in case of a flat. Tire plug kits are inexpensive and can be a life saver on long trips, they come in professional and emergency kits, its a good idea to keep one in your trunk or glove box.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cause : Punctured Tire',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solution : vehicle idle fluctuation, hard brake pedal, and a hissing noise heard under the hood.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description : Vacuum is responsible for drawing air into the cylinders, it is also responsible for the operation of emissions system, braking system and cruise control system components. Vacuum is transferred through a complex system of rubber hoses and/or plastic tubes. The engine creates a great deal of heat and over time can cause the rubber and plastic hoses to dry out and leak. A vacuum leak can be elusive and take a long time to detect. Common symptoms of a vacuum leak include',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cause : Damaged Valve Stem',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

void main() {
  runApp(MaterialApp(
    home: TireLooksFlatRepairIdeas(),
  ));
}