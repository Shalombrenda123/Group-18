import 'package:flutter/material.dart';

class SoundSelectionScreen extends StatelessWidget {
  const SoundSelectionScreen({super.key});

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
              'What do you hear?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DiagnosticOption(text: 'Squeal -- Continuous, high pitched sound.'),
                  DiagnosticOption(text: 'Knock -- Heavy, loud, repeating sound like a \nknock on the door.'),
                  DiagnosticOption(text: 'Tap -- Light repetitive sound, louder than a \nclick.'),
                  DiagnosticOption(text: 'Rattle -- Marbles in a can like something \nloose.'),
                  DiagnosticOption(text: 'Chirp -- High-pitched rapidly repeating \nsound, like birds chirping.'),
                  DiagnosticOption(text: 'Clunk -- A random thumping sound.'),
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
  const DiagnosticOption({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
                  style: const TextStyle(fontSize: 12), // Reduced font size to 10
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios), // Right arrow icon
          ],
        ),
      ),
    );
  }
}