import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: HeadlightBulbsVideoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HeadlightBulbsVideoScreen extends StatefulWidget {
  const HeadlightBulbsVideoScreen({super.key});

  @override
  _HeadlightBulbsVideoScreenState createState() => _HeadlightBulbsVideoScreenState();
}

class _HeadlightBulbsVideoScreenState extends State<HeadlightBulbsVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'GcsNu_9_Di8', // Replace with a headlight bulb tutorial video ID if available
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Headlight Bulbs Replacement")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            const SizedBox(height: 24),
            const Text(
              '1. Good to know',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Estimated savings: 8,000 FCFA'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time required: 10 minutes'),
            ),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('Difficulty: 2/3 (moderate)'),
            ),
            const SizedBox(height: 16),
            const Text(
              '2. Checklist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              children: const [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Tools', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Parts', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• Screwdriver'),
                            Text('• Gloves'),
                            Text('• Socket wrench (if needed)'),
                          ],
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• Headlight bulbs'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
