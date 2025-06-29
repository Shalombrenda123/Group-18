import 'package:flutter/material.dart';
import 'white_smoke_color_detail_screen.dart';
import 'black_smoke_color_screen.dart'; 
import 'blue_smoke_color_screen.dart'; 

class SmokeColorDetailScreen extends StatelessWidget {
  final String smokeColor;

  const SmokeColorDetailScreen({super.key, required this.smokeColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$smokeColor Smoke Details'),
      ),
      body: Center(
        child: Text(
          'Details for $smokeColor smoke will be displayed here.',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SmokeColorScreen extends StatelessWidget {
  const SmokeColorScreen({super.key});

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
              'What color is the smoke?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildOption(context, 'Black'),
            _buildOption(context, 'White'),
            _buildOption(context, 'Blue'),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        leading: const Icon(
          Icons.build,
          color: Colors.orange,
        ),
        title: Text(
          color,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          if (color == 'White') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WhiteSmokeScreen(),
              ),
            );
          } else if (color == 'Black') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlackSmokeScreen(),
              ),
            );
          } else if (color == 'Blue') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlueSmokeColorScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SmokeColorDetailScreen(smokeColor: color),
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SmokeColorScreen(),
  ));
}