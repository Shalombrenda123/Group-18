import 'package:flutter/material.dart';
import 'repair_idea_for_drifts.dart';
import 'repair_idea_for_excessive_play.dart';
import 'repair_idea_for_pulls.dart';

class SteeringFeelScreen extends StatelessWidget {
  const SteeringFeelScreen({super.key});

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
              'What do you feel?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DiagnosticOption(
                    text: 'Drifts -- Gradual movements to one side.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForDrifts()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 
                  'Excessive Play -- Looseness, lack of \nresponse in the steering wheel.',
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForExcessivePlay()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 
                  'Pulls -- Sharp movement to one side.',
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForPulls()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 'Pulsation -- Fluctuation of the brake pedal \nwhen the brakes are applied.'),
                  DiagnosticOption(text: 'Shimmy -- Rapid side to side movement \nof the front wheels.'),
                  DiagnosticOption(text: 'Sway -- Gradual movement from side to \nside.'),
                  DiagnosticOption(text: 'Vibration -- Vehicle shakes. Usually felt in \nthe steering wheel or the seat.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiagnosticOption extends StatelessWidget {
  const DiagnosticOption({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.build, color: Colors.orange), // Wrench icon
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios), // Right arrow icon
            ],
          ),
        ),
      ),
    );
  }
}