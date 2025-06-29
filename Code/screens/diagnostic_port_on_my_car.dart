import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiagnosticPortOnMyCarScreen extends StatefulWidget {
  const DiagnosticPortOnMyCarScreen({super.key});

  @override
  State<DiagnosticPortOnMyCarScreen> createState() => _DiagnosticPortOnMyCarScreenState();
}

class _DiagnosticPortOnMyCarScreenState extends State<DiagnosticPortOnMyCarScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '8K2UBSSVlwQeNXXC', // ✅ Make sure this is the correct 11-character YouTube ID
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
      appBar: AppBar(
        title: const Text("Diagnostic Port on My Car"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
