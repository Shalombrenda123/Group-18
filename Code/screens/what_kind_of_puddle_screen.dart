import 'package:flutter/material.dart';

class WhatKindOfPuddleScreen extends StatelessWidget {
  const WhatKindOfPuddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Idea(s):'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What type of puddle or leak do you see?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Engine Oil Section
            _buildLeakTypeCard(
              title: 'Engine oil - I see brown to almost black engine oil',
              items: [
                _buildLeakItem(
                  description: 'Valve cover gaskets are subject to normal wear and tear which may cause leaks. An overly hot engine may also cause the valve cover to break.',
                  cause: 'Leaking Valve Covers',
                  solution: 'Engine Tune – Up',
                ),
                _buildLeakItem(
                  description: 'Oil filters may leak due to improper installation or from regular wear.',
                  cause: 'Leaking Oil Filter',
                  solution: 'Lube and Oil Change',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Transmission Fluid Section
            _buildLeakTypeCard(
              title: 'Automatic Transmission fluid - Fluid is red or pink to light brown',
              items: [
                _buildLeakItem(
                  description: 'Transmission cooler lines may become loose and leak at radiator fittings due to regular vibrations.',
                  cause: 'Leaking Transmission Lines',
                  solution: 'Automatic Transmission Repair',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Power Steering Fluid Section
            _buildLeakTypeCard(
              title: 'Power Steering Fluid - Fluid is red or pink to light brown',
              items: [
                _buildLeakItem(
                  description: 'It is common for power steering hoses to leak or malfunction from regular wear.',
                  cause: 'Leaking Power Steering Hose',
                  solution: 'Steering and Suspension System',
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Coolant Section
            _buildLeakTypeCard(
              title: 'Coolant is watery or is green or orange.',
              items: [
                _buildLeakItem(
                  description: 'A leak may occur from failing components in the cooling system.',
                  cause: 'Leaking Water Pump',
                  solution: 'Cooling System Repair',
                ),
                _buildLeakItem(
                  description: 'The radiator may leak due to regular wear and tear, if the vehicle overheats or if coolant goes unmaintained the radiator may also begin to leak or malfunction. Regular maintenance is necessary.',
                  cause: 'Leaking Radiator and Cap',
                  solution: 'Cooling System Repair',
                ),
                _buildLeakItem(
                  description: 'Normal heating and cooling will cause the radiator hoses to become brittle and crack or leak.',
                  cause: 'Leaking Radiator Hose',
                  solution: 'null',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeakTypeCard({required String title, required List<Widget> items}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildLeakItem({required String description, required String cause, required String solution}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description: $description',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Cause: $cause',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Solution: $solution',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}