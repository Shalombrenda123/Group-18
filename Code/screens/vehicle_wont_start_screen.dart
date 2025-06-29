import 'package:flutter/material.dart';
import 'one_strong_click_screen.dart'; 
import 'spinning_whirling_gear_grinding_screen.dart';
import 'repair_idea_for_repeating_clicking.dart';
import 'repair_idea_for_nothing.dart';
import 'repair_idea_for_the_vehicle_is_backfiring.dart';
import 'repair_idea_for_engine_cranks_over.dart';
import 'repair_idea_for_engine_cranks_normally_but_no_start.dart';// Import the one_strong_click_screen.dart

class VehicleWontStartScreen extends StatelessWidget {
  const VehicleWontStartScreen({super.key});

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
              'What happens when you try to start the vehicle?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DiagnosticOption(text: 
                  'The engine cranks normally but does not start',
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForEngineCranksNormallyButNoStart()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 
                  'The engine cranks over slowly',
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForEngineCranksOver()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 
                  'The vehicle is backfiring when trying to start',
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForTheVehicleIsBackfiring()),
                      );
                    },
                  ),
                  DiagnosticOption(text: 
                  'Nothing',
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForNothing()),
                      );
                    },
                  ),
                  DiagnosticOption(
                    text: 'One strong click or knock',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OneStrongClickScreen()),
                      );
                    },
                  ),
                  DiagnosticOption(
                    text: 'A spinning, whirling, or gear grinding sound',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpinningWhirlingGearGrindingScreen()),
                      );
                    },
                    ),
                  DiagnosticOption(text: 
                  'Repeating clicking sound: "click, click, click"',
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RepairIdeaForRepeatingClicking()),
                      );
                    },
                  ),
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
  const DiagnosticOption({
    super.key,
    required this.text,
    this.onTap, // Add an optional onTap callback
  });

  final String text;
  final VoidCallback? onTap; // Define the onTap callback

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: InkWell( // Wrap with InkWell for tap effect
        onTap: onTap, // Use the provided onTap callback
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
                    style: const TextStyle(fontSize: 11),
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