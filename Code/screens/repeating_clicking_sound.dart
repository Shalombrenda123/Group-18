import 'package:flutter/material.dart';

class RepeatingClickingSound extends StatelessWidget {
  const RepeatingClickingSound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeating Clicling Repair Ideas'),
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
              'Could be because of the following reasons:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
             '1. Normal Condensation (Cold Start)',
             'Description:\nThe cause for replacement may be normal wear. Batteries should last 3 to 5 years under normal use.',
              'Cause:\nWeak Battery',
              'Solution:\nBattery Replacement',
            ),
            const SizedBox(height: 16),
            _buildSection(
              '2. Coolant Leak into Combustion Chamber',
              'Description:\nContinuous white smoke that has a sweet smell and does not go away during driving.',
              'Cause:\nCoolant leaking into the engine\'s combustion chamber, usually due to a blown head gasket, cracked cylinder head, or damaged engine block.',
              'Solution:\nHave the engine inspected and repaired by a mechanic promptly to avoid severe engine damage. This often requires replacing the head gasket or fixing the damaged parts.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              '3. Transmission Fluid Leak (Rare)',
              'Description:\nWhite smoke coming from the exhaust, mostly in automatic transmission cars.',
              'Cause:\nTransmission fluid leaking into the engine via a faulty vacuum modulator.',
              'Solution:\nInspect and repair or replace the vacuum modulator or transmission components causing the leak.',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, String cause, String solution) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(description),
        const SizedBox(height: 8),
        Text(
          'Cause:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(cause),
        const SizedBox(height: 8),
        Text(
          'Solution:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(solution),
      ],
    );
  }
}
