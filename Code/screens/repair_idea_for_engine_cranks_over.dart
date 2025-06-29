import 'package:flutter/material.dart';

class RepairIdeaForEngineCranksOver extends StatelessWidget {
  const RepairIdeaForEngineCranksOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Ideas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Repair idea(s) :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'The cause for replacement may be normal wear. Batteries should last 3 to 5 years under normal use.',
                cause: 'Weak Battery',
                solution: 'Battery Replacement',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'A leaking battery, normal wear and over-tightening can all cause damage to the battery terminals.',
                cause: 'Corroded Battery Terminals',
                solution: 'Battery Replacement',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'The starter is a high torque electrical motor that is attached to the rear of the engine. It is used to crank the engine until it can operate on its own power.',
                cause: 'Bad Starter',
                solution: 'Starter Replacement',
              ),
             
              const SizedBox(height: 24),
              Center(
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
      ),
    );
  }
}

class RepairIdeaCard extends StatelessWidget {
  const RepairIdeaCard({
    super.key,
    required this.description,
    required this.cause,
    required this.solution,
  });

  final String description;
  final String cause;
  final String solution;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description : $description',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Cause : $cause',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Solution : $solution',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}