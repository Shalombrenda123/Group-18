import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class AutomaticDiagnosticScreen extends StatefulWidget {
  const AutomaticDiagnosticScreen({super.key});

  @override
  _AutomaticDiagnosticScreenState createState() => _AutomaticDiagnosticScreenState();
}

class _AutomaticDiagnosticScreenState extends State<AutomaticDiagnosticScreen> {
  @override
  void initState() {
    super.initState();
    _checkBluetoothPermission();
  }

  Future<void> _checkBluetoothPermission() async {
    // Request necessary permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse, // Required for scanning on Android 12+
    ].request();

    // If any permission denied or permanently denied, show dialog and return
    if (statuses.values.any((status) => status.isDenied || status.isPermanentlyDenied)) {
      _showPermissionDeniedDialog();
      return;
    }

    // Check if Bluetooth is supported on device
    if (!await FlutterBluePlus.isSupported) {
      _showBluetoothNotSupportedDialog();
      return;
    }

    // Check if Bluetooth is ON
    BluetoothAdapterState state = await FlutterBluePlus.adapterState.first;
    if (state != BluetoothAdapterState.on) {
      // Prompt to turn Bluetooth ON (Android only)
      await FlutterBluePlus.turnOn();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: const Text(
          'Bluetooth and location permissions are required for automatic diagnostics.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showBluetoothNotSupportedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bluetooth Not Supported'),
        content: const Text('This device does not support Bluetooth functionality.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Automatic Diagnostic'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/obd.jpeg',
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  '1. Buy your car diagnostic OBD2 Bluetooth device.\n'
                  '2. Plug your diagnostic device into your Car’s port.\n'
                  '3. Turn your ignition on.\n'
                  '4. Connect your smartphone to your diagnostic device.\n'
                  '5. Launch your car diagnostic.',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add your "Run" button functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text(
                    'RUN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
