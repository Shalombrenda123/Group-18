import 'package:flutter/material.dart';

class RepairIdeaForEngineCranksNormallyButNoStart extends StatelessWidget {
  const RepairIdeaForEngineCranksNormallyButNoStart({super.key});

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
                    'If there is no fuel pressure the engine will not start, The first check in fuel delivery problem is the fuel gauge if there is fuel in the tank but no fuel pressure, a bad fuel pump may be the cause.',
                cause: 'No Fuel Pressure',
                solution: 'Fuel Injection',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'Timing chains are subjected to normal wear and tear over the life of the vehicle. The constant wear and tear will stretch the timing chain and wear the teeth of the timing gears. This includes the seals as well.',
                cause: 'Bad Timing/Belt',
                solution: 'Timing Belt Replacement',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'The ignition control unit is a non-service item that should last the life the vehicle, but like other electronic components they can sometimes fail.',
                cause: 'No Spark',
                solution: 'Engine Tune-Up',
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