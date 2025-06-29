import 'package:flutter/material.dart';

class RepairIdeaForPulls extends StatelessWidget {
  const RepairIdeaForPulls({super.key});

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
                    'Loose or worn suspension components will affect vehicle handling and wheel alignment. Loose wheel bearings and worn bushings can cause vibrations, pulling, and increased tire wear.',
                cause: 'Loose or Worn Front End Component',
                solution: 'Suspension Inspection',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'Brake calipers will usually bind on the slides from being improperly lubed or overly dirty. Gunk builds up on the slides and will not allow the caliper to press together, preventing the pads from stopping the rotor from spinning.',
                cause: 'Dragging Front Brake',
                solution: 'Front Disc Brake Repair',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'A wheel alignment is very important, it keeps the vehicle running smooth and makes sure all the parts of the steering and suspension are working together. When the vehicle is out of alignment it can put stress on other components of the steering and suspension and cause them to wear faster. There are also safety concerns when a vehicle is improperly aligned. When you have suspension related parts replaced you should ask your technician if the vehicle needs to be aligned.',
                cause: 'Wheels Out of Alignment',
                solution: 'Four-Wheel Alignment',
              ),
              const SizedBox(height: 16),
              RepairIdeaCard(
                description:
                    'Tire pressure is often overlooked but it directly influences how a vehicle rides on the road, Low tire pressure can affect handling, ride, and fuel economy. Over-inflating tires can cause the vehicle to ride hard, and the tires to wear prematurely. Temperature directly affects tire pressure, check the pressure regularly.',
                cause: 'Unequal Front Tire Pressure',
                solution: 'TPMS Repair',
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