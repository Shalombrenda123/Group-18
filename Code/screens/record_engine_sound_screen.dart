import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecordEngineSoundScreen extends StatefulWidget {
  const RecordEngineSoundScreen({super.key});

  @override
  _RecordEngineSoundScreenState createState() => _RecordEngineSoundScreenState();
}

class _RecordEngineSoundScreenState extends State<RecordEngineSoundScreen> {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool isRecording = false;
  bool isPlaying = false;
  bool hasRecording = false;
  String? recordedFilePath;
  String? standardFilePath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    _init();
  }

  Future<void> _init() async {
    await _recorder!.openRecorder();
    await _player!.openPlayer();
    await Permission.microphone.request();
    await _copyStandardEngineSound();
  }

  // Copy asset sound to local file for comparison
  Future<void> _copyStandardEngineSound() async {
    final byteData = await rootBundle.load('assets/sounds/standard_engine.wav');
    final file = File('${(await getApplicationDocumentsDirectory()).path}/standard_engine.wav');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    standardFilePath = file.path;
  }

  Future<String> _getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/engine_sound.wav';
  }

  Future<void> _startRecording() async {
    final path = await _getFilePath();
    await _recorder!.startRecorder(toFile: path, codec: Codec.pcm16WAV);
    setState(() {
      isRecording = true;
      hasRecording = false;
    });
  }

  Future<void> _stopRecording() async {
    final path = await _recorder!.stopRecorder();
    setState(() {
      isRecording = false;
      recordedFilePath = path;
      hasRecording = true;
    });
  }

  Future<void> _playRecording() async {
    if (recordedFilePath != null) {
      await _player!.startPlayer(
        fromURI: recordedFilePath,
        whenFinished: () => setState(() => isPlaying = false),
      );
      setState(() => isPlaying = true);
    }
  }

  Future<void> _stopPlayback() async {
    await _player!.stopPlayer();
    setState(() => isPlaying = false);
  }

  Future<void> _deleteRecording() async {
    if (recordedFilePath != null) {
      final file = File(recordedFilePath!);
      if (await file.exists()) {
        await file.delete();
        setState(() {
          recordedFilePath = null;
          hasRecording = false;
        });
      }
    }
  }

  // Dummy comparison: checks file size (replace with real algorithm later)
  Future<void> _compareWithStandard() async {
    if (recordedFilePath == null || standardFilePath == null) return;

    final recordedFile = File(recordedFilePath!);
    final standardFile = File(standardFilePath!);

    final recordedLength = await recordedFile.length();
    final standardLength = await standardFile.length();

    final difference = (recordedLength - standardLength).abs();

    String result = difference < 1000 ? "Normal" : "Noise";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Comparison Result"),
        content: Text("Your engine sound is: $result"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _player!.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Compare Engine Sound'),
        backgroundColor: Colors.deepPurple,
        leading: BackButton(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.car_repair, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: Icon(isRecording ? Icons.stop : Icons.mic),
                label: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
                onPressed: isRecording ? _stopRecording : _startRecording,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isRecording ? Colors.red : Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                    label: Text(isPlaying ? 'Stop' : 'Play'),
                    onPressed: hasRecording
                        ? (isPlaying ? _stopPlayback : _playRecording)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                    onPressed: hasRecording ? _deleteRecording : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: Icon(Icons.analytics),
                label: Text('Compare with Standard'),
                onPressed: hasRecording ? _compareWithStandard : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}