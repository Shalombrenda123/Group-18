import 'package:flutter/material.dart';
import '../screens/record_engine_sound_screen.dart';
import '../screens/repair_your_car_screen.dart';
import '../screens/maintenance_book_screen.dart';
import '../screens/dashboard_scanning_screen.dart';
import '../screens/OBD_code_screen_state.dart';
import '../screens/mechanic_info_screen.dart';

class CarCareGrid extends StatelessWidget {
  CarCareGrid({super.key});

  final List<Map<String, dynamic>> items = [
    {
      "icon": Icons.dashboard_customize,
      "label": "Dashboard Scanning",
    },
    {
      "icon": Icons.graphic_eq,
      "label": "Record Engine Sound",
    },
    {
      "icon": Icons.build,
      "label": "Repair Tutorials",
      "route": '/repair_tutorials',
    },
    {
      "icon": Icons.assignment,
      "label": "Maintenance Book",
      "route": '/maintenance_book',
    },
    {
      "icon": Icons.search,
      "label": "OBD Codes",
      "route": '/obd_code',
    },
    {
      "icon": Icons.engineering,
      "label": "Our Diagnostics",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              final label = items[index]['label'];

              if (label == 'Repair Tutorials') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RepairYourCarScreen()),
                );
              } else if (label == 'Maintenance Book') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MaintenanceBookScreen()),
                );
              } else if (label == 'Dashboard Scanning') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScanningScreen()),
                );
              } else if (label == 'OBD Codes') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OBDCodeScreen()),
                );
              } else if (label == 'Record Engine Sound') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordEngineSoundScreen()),
                );
              } else if (label == 'Our Diagnostics') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MechanicInfoScreen()),
                );
              }
            },
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[100],
                  child: Icon(items[index]['icon'], color: Colors.blue),
                ),
                const SizedBox(height: 6),
                Text(
                  items[index]['label'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
