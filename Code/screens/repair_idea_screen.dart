import 'package:flutter/material.dart';

class RepairIdeaScreen extends StatelessWidget {
  const RepairIdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repair Idea')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ // Removed 'const' here because we're adding a non-const widget (GestureDetector)
            const Text(
              'Repair idea(s) :',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description : Your vehicle\'s radiator may begin to leak due to normal wear. Failure may happen if coolant goes unserviced, if the vehicle suffers collision damage, or if the vehicle overheats. It is important to regularly maintain the cooling system to prolong the life of the radiator.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cause : Coolant Leak',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Solution : Cooling System Flush & Fill',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector( // Wrapped the Text widget with GestureDetector
                onTap: () {
                  Navigator.pop(context); // This will go back to the previous screen
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}