import 'package:flutter/material.dart';

class RepairIdeaForNothing extends StatelessWidget {
  const RepairIdeaForNothing({super.key});

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
                cause: 'Dead Battery',
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
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'There are a few reasons your key may not turn in your ignition, first make sure your steering wheel hasn\'t locked the ignition, this can happen if the wheel is turned all the way in one direction and you are parked on an incline. Try to free it by turning the wheel hard in the direction the wheels are pointing and turning the key at the same time. Second is that your key may be too worn for the cylinder to function with the key properly anymore, try using a spare key if you have one, or sometimes having a new key made will compensate ofr worn down key. \nLast the ignition itself can break over time from regular use and will need to be replaced',
                cause: 'Faulty Ignition Switch',
                solution: 'Starting and Charging System Check',
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