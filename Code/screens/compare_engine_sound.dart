import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class CompareEngineSoundPage extends StatefulWidget {
  const CompareEngineSoundPage({super.key});
  @override
  _CompareEngineSoundPageState createState() => _CompareEngineSoundPageState();
}

class _CompareEngineSoundPageState extends State<CompareEngineSoundPage> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  String? _userPath, _stdPath;
  bool _rec = false;
  String? _res;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
    final d = await getApplicationDocumentsDirectory();
    _userPath = '${d.path}/user_engine.aac';
    _stdPath = '${d.path}/standard_engine.aac';
    final data = await rootBundle.load('assets/sounds/standard_engine.aac');
    await File(_stdPath!).writeAsBytes(data.buffer.asUint8List());
  }

  Future _start() async {
    await _recorder.startRecorder(toFile: _userPath, codec: Codec.aacADTS);
    setState(() => _rec = true);
  }

  Future _stop() async {
    await _recorder.stopRecorder();
    setState(() => _rec = false);
  }

  Future _compare() async {
    if (_userPath == null || _stdPath == null) return;
    final u = File(_userPath!), s = File(_stdPath!);
    if (!u.existsSync() || !s.existsSync()) { setState(() => _res = 'No recordings'); return; }
    final ub = await u.readAsBytes(), sb = await s.readAsBytes();
    final min = ub.length < sb.length ? ub.length : sb.length;
    int diff = 0;
    for (int i = 0; i < min; i++) {
      diff += (ub[i] - sb[i]).abs();
    }
    final sim = 1 - (diff / (min * 255));
    setState(() => _res = sim > 0.90 ? '✅ Normal' : '❌ Noise Detected');
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) => Scaffold(
    appBar: AppBar(title: const Text('Compare Engine Sound'), backgroundColor: Colors.deepPurple),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: !_rec ? _start : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Start Recording'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _rec ? _stop : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Stop Recording'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _compare,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Compare with Standard'),
          ),
          const SizedBox(height: 24),
          if (_res != null)
            Text(
              _res!,
              style: TextStyle(
                fontSize: 22,
                color: _res!.startsWith('❌') ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    ),
  );
}