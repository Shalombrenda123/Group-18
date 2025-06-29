import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: RearLightBulbsVideoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class RearLightBulbsVideoScreen extends StatefulWidget {
  const RearLightBulbsVideoScreen({super.key});

  @override
  _RearLightBulbsVideoScreenState createState() => _RearLightBulbsVideoScreenState();
}

class _RearLightBulbsVideoScreenState extends State<RearLightBulbsVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '1g6CzNs8ptw', // Replace with actual rear light bulbs tutorial video ID
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
      appBar: AppBar(title: const Text("Rear Light Bulbs Replacement")),
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
              title: Text('Estimated savings: 7,500 FCFA'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Time required: 10 minutes'),
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
                            Text('• Phillips screwdriver'),
                            Text('• Flathead screwdriver'),
                            Text('• Gloves'),
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
                            Text('• Rear light bulbs'),
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
