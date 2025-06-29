import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/record_engine_sound_screen.dart';
import 'screens/repair_your_car_screen.dart';
import 'screens/maintenance_book_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Fault Finder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/repair_tutorials': (_) => RepairYourCarScreen(),
        '/maintenance_book': (_) => MaintenanceBookScreen(),
        '/record_engine_sound': (_) => RecordEngineSoundScreen(),
      },
    );
  }
}
