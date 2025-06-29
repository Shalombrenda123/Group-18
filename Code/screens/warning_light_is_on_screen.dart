
import 'package:flutter/material.dart';
import 'engine_light_repair_idea.dart'; // Import the new screen
import 'tire_pressure_light_repair_idea.dart'; // Import the tire pressure screen
import 'temperature_warning_light_repair_idea.dart'; // Import the temperature warning light screen
import 'battery_charge_warning_light_repair_idea_screen.dart'; // Import the battery charge screen
import 'oil_pressure_warning_light_screen.dart'; // Import the oil pressure screen
import 'brake_warning_light_repair_idea_screen.dart'; // Import the brake warning light screen
import 'abs_warning_light_repair_idea_screen.dart'; // Import the ABS warning light screen
import 'check_engine_light_on_with_code_repait_idea_screen.dart';

class WarningLightIsOnScreen extends StatelessWidget {
  const WarningLightIsOnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Diagnostic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Which warning light is on ?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  WarningLightItem(lightName: 'Check Engine Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EngineLightRepairIdeaScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'Tire Pressure Light (TPMS)', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TirePressureLightRepairIdeasScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'Temperature Warning Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TemperatureWarningLightRepairIdea()),
                    );
                  }),
                  WarningLightItem(lightName: 'Battery Charge Warning Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BatteryChargeWarningLightRepairIdeaScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'Oil Pressure Warning Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OilPressureWarningLightRepairIdeaScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'Brake Warning Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BrakeWarningLightRepairIdeaScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'ABS Warning Light', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AbsWarningLightRepairIdeaScreen()),
                    );
                  }),
                  WarningLightItem(lightName: 'Check Engine Light on with code P0382, or P0400-P0408', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckEngineLightOnWithCodeRepaitIdeaScreen()),
                      );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarningLightItem extends StatelessWidget {
  const WarningLightItem({super.key, required this.lightName, required this.onTap});

  final String lightName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: const Icon(Icons.build),
        title: Text(lightName),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}