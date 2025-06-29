import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: BatteryVideoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class BatteryVideoScreen extends StatefulWidget {
  const BatteryVideoScreen({super.key});

  @override
  _BatteryVideoScreenState createState() => _BatteryVideoScreenState();
}

class _BatteryVideoScreenState extends State<BatteryVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'lqd-A6bteqw', // ✅ Make sure this is a valid video ID
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
      appBar: AppBar(title: const Text("Battery Replacement")),
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
                title: Text('Estimated savings: 5,000 FCFA'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time required: 5 minutes'),
            ),
            const ListTile(
              leading: Icon(Icons.star),
              title: Text('Difficulty: 1/3 (easy)'),
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
                            Text('• Ratchet + extension bar'),
                            Text('• 13mm socket'),
                            Text('• 10mm socket'),
                            Text('• Sandpaper'),
                            Text('• Paper towel · Copper grease'),
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
                            Text('• Battery'),
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
