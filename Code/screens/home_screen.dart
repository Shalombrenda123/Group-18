import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/car_info_card.dart';
import '../widgets/diagnostic_option_card.dart';
import '../widgets/car_care_grid.dart';
import 'update_car_screen.dart';
import 'diagnostic_port_on_my_car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? carBrand;
  String? carModel;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      carBrand = prefs.getString('carBrand');
      carModel = prefs.getString('carModel');
      email = prefs.getString('email');
    });
  }

  Future<void> _saveData(String brand, String model, String emailInput) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('carBrand', brand);
    await prefs.setString('carModel', model);
    await prefs.setString('email', emailInput);
  }

  void _navigateToUpdateCarScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateCarScreen(
          onSave: (brand, model, emailInput) async {
            await _saveData(brand, model, emailInput);
            setState(() {
              carBrand = brand;
              carModel = model;
              email = emailInput;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String displayBrand = carBrand ?? 'Autre – Other';
    final String displayModel = carModel ?? 'Autre – Other';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'update_car') {
                _navigateToUpdateCarScreen();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'update_car',
                child: Text('Update Car Info'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (email != null && email!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Email: $email'),
              ),
            const SizedBox(height: 16),
            CarInfoCard(
              title: displayBrand,
              subtitle: displayModel,
              question: 'Where is the diagnostic port on my car?',
              onQuestionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiagnosticPortOnMyCarScreen(),
                  ),
                );
              },
              onTitleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateCarScreen(
                      onSave: (brand, model, emailInput) async {
                        await _saveData(brand, model, emailInput);
                        setState(() {
                          carBrand = brand;
                          carModel = model;
                          email = emailInput;
                        });
                      },
                    ),
                  ),
                );
              },
              onTap: null, // whole card tap disabled
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 10.0),
              child: Text(
                "Diagnose your Car’s problems",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const DiagnosticOptionsRow(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 24.0),
              child: Text(
                "Take care of your car",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            CarCareGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
