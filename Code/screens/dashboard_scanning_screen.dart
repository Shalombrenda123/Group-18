import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class DashboardScanningScreen extends StatefulWidget {
  const DashboardScanningScreen({super.key});

  @override
  State<DashboardScanningScreen> createState() => _DashboardScanningScreenState();
}

class _DashboardScanningScreenState extends State<DashboardScanningScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  Uint8List? _imageBytes;
  bool _isLoading = false;
  String _result = "";

  // Pick image from camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final image = await _picker.pickImage(source: source, imageQuality: 60);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImage = image;
        _imageBytes = bytes;
        _result = "";
      });
    }
  }

  // Send image and prompt to Gemini 1.5
  Future<void> _sendImageToGemini() async {
    if (_imageBytes == null) return;

    setState(() {
      _isLoading = true;
      _result = "";
    });

    try {
      const apiKey = "AIzaSyBtF0aO9y9ZosJz95UURbWVsoYsAFzqqHk"; // ⚠️ Replace with your actual Gemini API key
      final uri = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey",
      );

      final base64Image = base64Encode(_imageBytes!);

      final payload = {
        "contents": [
          {
            "role": "user",
            "parts": [
              {
                "inlineData": {
                  "mimeType": "image/jpeg",
                  "data": base64Image,
                }
              },
              {
                "text":
                    "Interpret this car dashboard image and provide insights on warning lights and possible faults."
              }
            ]
          }
        ]
      };

      final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final text = json["candidates"]?[0]["content"]["parts"]?[0]["text"];
        setState(() {
          _result = text ?? "No interpretation returned.";
        });
      } else {
        setState(() {
          _result = "Error ${response.statusCode}: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = _imageBytes != null
        ? Image.memory(_imageBytes!, height: 200)
        : const SizedBox();

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Scanning')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'What do you want to do?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Capture Image'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text('Upload from Gallery'),
            ),
            const SizedBox(height: 20),
            if (_imageBytes != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selected Image:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  imageWidget,
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _isLoading ? null : _sendImageToGemini,
                    icon: const Icon(Icons.send),
                    label: _isLoading
                        ? const Text("Analyzing...")
                        : const Text("Send to Gemini"),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
