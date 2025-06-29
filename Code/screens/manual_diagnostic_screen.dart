import 'package:flutter/material.dart';
import 'what_do_you_see_screen.dart';
import 'vehicle_wont_start_screen.dart';
import 'odor_selection_screen.dart';
import 'steering_feel_screen.dart';
import 'sound_selection_screen.dart';

class ManualDiagnosticScreen extends StatelessWidget {
  const ManualDiagnosticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Diagnostic'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Start by describing the issue:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 2.0, // Adjusted for better mobile phone view
              children: [
                _buildDiagnosticButton(
                  context,
                  'What do you see?',
                  Icons.visibility,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WhatDoYouSeeScreen()),
                    );
                  },
                ),
                _buildDiagnosticButton(
                  context,
                  'What do you hear?',
                  Icons.hearing,
                  () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SoundSelectionScreen()),
                    );// Add navigation for "What do you hear?"
                  },
                ),
                _buildDiagnosticButton(
                  context,
                  'What odor do you smell?',
                  Icons.air,
                  () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OdorSelectionScreen()),
                    );// Add navigation for "What odor do you smell?"
                  },
                ),
                _buildDiagnosticButton(
                  context,
                  'What do you feel?',
                  Icons.touch_app,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SteeringFeelScreen()),
                    );// Add navigation for "What do you feel?"
                  },
                ),
                _buildDiagnosticButton(
                  context,
                  "The vehicle won't start",
                  Icons.person,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleWontStartScreen()),
                    ); // Add navigation for "The vehicle won't start"
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagnosticButton(
      BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        label,
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16), // Square shaped buttons
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
    );
  }
}