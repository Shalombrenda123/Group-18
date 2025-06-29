import 'package:flutter/material.dart';
import 'where_is_smoke_screen.dart';
import 'tire_looks_flat_repair_ideas.dart';
import 'warning_light_is_on_screen.dart';
import 'what_kind_of_puddle_screen.dart'; // Import the new screen

class WhatDoYouSeeScreen extends StatelessWidget {
  final bool isSecondScreen;

  const WhatDoYouSeeScreen({super.key, this.isSecondScreen = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What do you see?'),
      ),
      body: ListView(
        children: [
          _buildListItem(context, 'Smoke', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WhereIsSmokeScreen()),
            );
          }),
          _buildListItem(context, 'Tire looks flat', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TireLooksFlatRepairIdeas()),
            );
          }),
          _buildListItem(context, 'Warning light is on', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WarningLightIsOnScreen()),
            );
          }),
          _buildListItem(context, 'Puddle or leak', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WhatKindOfPuddleScreen()),
            );// Handle "Puddle or leak" selection
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text, VoidCallback onTap) {
    return ListTile(
      leading: const Icon(Icons.build), // Replace with your wrench/screwdriver icon
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}