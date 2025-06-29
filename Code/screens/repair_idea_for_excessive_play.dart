import 'package:flutter/material.dart';

class RepairIdeaForExcessivePlay extends StatelessWidget {
  const RepairIdeaForExcessivePlay({super.key});

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
                    'Tie rod ends are part of the steering system, tie rods are responsible for wheel alignment toe, and steering. Worn tie rod ends can cause abnormal tire wear, front end noise, and wheel shimmy or looseness in steering.',
                cause: 'Loose/Worn Tie Rod Ends',
                solution: 'Inner Tie Rod & Outer Tie Rod Replacement',
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