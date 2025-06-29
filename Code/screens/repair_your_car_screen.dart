import 'package:flutter/material.dart';
import 'battery_video_screen.dart';
import 'change_oil_video_screen.dart'; 
import 'head_light_bulb_video_screen.dart';
import 'rear_lights_bulb_video_screen.dart';// Make sure this is the correct path

class RepairYourCarScreen extends StatelessWidget {
  final List<_RepairItem> items = [
    _RepairItem('Battery', Icons.battery_charging_full),
    _RepairItem('Change oil', Icons.oil_barrel),
    _RepairItem('Headlight bulbs', Icons.directions_car_filled),
    _RepairItem('Rear light bulbs', Icons.directions_car),
    _RepairItem('Spark Plugs', Icons.electrical_services),
    _RepairItem('Brake', Icons.stop_circle),
    _RepairItem('Air filter', Icons.filter_alt),
    _RepairItem('Pollen filter', Icons.ac_unit),
  ];

   RepairYourCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repair your Car"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.directions_car),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                if (item.label == 'Battery') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BatteryVideoScreen()),
                  );
                } else if (item.label == 'Change oil') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChangeOilVideoScreen()),
                  );
                } else if (item.label == 'Headlight bulbs') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeadlightBulbsVideoScreen()),
                  );
                } else if (item.label == 'Rear light bulbs') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RearLightBulbsVideoScreen()),
                  );
                } else {
                  // TODO: Add more navigation for other items
                  print('Tapped on ${item.label}');
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 50, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(item.label,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RepairItem {
  final String label;
  final IconData icon;

  _RepairItem(this.label, this.icon);
}
