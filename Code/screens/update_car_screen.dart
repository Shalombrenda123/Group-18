import 'package:flutter/material.dart';

class UpdateCarScreen extends StatefulWidget {
  final Function(String, String, String) onSave;

  const UpdateCarScreen({super.key, required this.onSave});

  @override
  _UpdateCarScreenState createState() => _UpdateCarScreenState();
}

class _UpdateCarScreenState extends State<UpdateCarScreen> {
  final List<String> carBrands = [
    'AC', 'Acura', 'Adler', 'Alfa Romeo', 'Alpina', 'Alpine', 'AM General',
    'AMC', 'Apal', 'Ariel', 'Aro', 'Bertone', 'Dia', 'Bilenkin', 'Bio auto',
    'Bitter', 'BMW', 'Borgward', 'Brabus', 'Brilliance', 'Bristol', 'Bufori',
    'Bugatti', 'Buick', 'Call away', 'Ferrari', 'Eagle', 'Rolls-Royce',
  ];

  String? selectedBrand;
  final TextEditingController modelController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _handleSave() {
    if (selectedBrand != null && modelController.text.isNotEmpty) {
      widget.onSave(
        selectedBrand!,
        modelController.text.trim(),
        emailController.text.trim(),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a brand and enter the model')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update your car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for car brand
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Autre - Other (Brand)'),
              value: selectedBrand,
              items: carBrands.map((brand) {
                return DropdownMenuItem(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBrand = value;
                });
              },
            ),

            // Text input for model
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Autre - Other (Model)'),
            ),

            // Text input for email
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email (optional)'),
            ),

            const SizedBox(height: 20),

            // Cancel and Continue buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleSave,
                    child: Text('Continue'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}