// Update lib/widgets/diagnostic_option_card.dart
import 'package:car/screens/automatic_diagnostic_screen.dart';
import 'package:flutter/material.dart';
import '../screens/manual_diagnostic_screen.dart';

class DiagnosticOptionsRow extends StatelessWidget {
  const DiagnosticOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DiagnosticCard(
          image: 'assets/auto_diag.jpg',
          label: 'Automatic\nDiagnostic',
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AutomaticDiagnosticScreen()),
            );// Handle automatic diagnostic navigation
          },
        ),
        DiagnosticCard(
          image: 'assets/manual_diag.jpg',
          label: 'Manual\nDiagnostic',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManualDiagnosticScreen()),
            );
          },
        ),
      ],
    );
  }
}

class DiagnosticCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback? onTap;

  const DiagnosticCard({
    super.key,
    required this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.asset(image, height: 100, fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}