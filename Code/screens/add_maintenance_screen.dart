import 'package:flutter/material.dart';

class MaintenanceEntry {
  final String type;
  final DateTime date;
  final String mileage;
  final String price;
  final String repairCenter;

  MaintenanceEntry({
    required this.type,
    required this.date,
    required this.mileage,
    required this.price,
    required this.repairCenter,
  });
}

class AddMaintenanceScreen extends StatefulWidget {
  final Function(MaintenanceEntry) onSave;
  final MaintenanceEntry? existingEntry;

  const AddMaintenanceScreen({super.key, required this.onSave, this.existingEntry});

  @override
  _AddMaintenanceScreenState createState() => _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends State<AddMaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedMaintenanceType;
  DateTime? _selectedDate;
  late TextEditingController _mileageController;
  late TextEditingController _priceController;
  late TextEditingController _repairCenterController;

  final List<String> _maintenanceTypes = [
    'Battery', 'Glow Ups', 'Engine Descaling', 'Exhaust',
    'Fuel Filter', 'Oil Filter', 'Brake Fluid'
  ];

  @override
  void initState() {
    super.initState();
    final entry = widget.existingEntry;
    _selectedMaintenanceType = entry?.type;
    _selectedDate = entry?.date;
    _mileageController = TextEditingController(text: entry?.mileage);
    _priceController = TextEditingController(text: entry?.price);
    _repairCenterController = TextEditingController(text: entry?.repairCenter);
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _saveMaintenance() {
    if (_formKey.currentState!.validate() && _selectedMaintenanceType != null && _selectedDate != null) {
      final entry = MaintenanceEntry(
        type: _selectedMaintenanceType!,
        date: _selectedDate!,
        mileage: _mileageController.text,
        price: _priceController.text,
        repairCenter: _repairCenterController.text,
      );
      widget.onSave(entry);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingEntry != null ? 'Edit Maintenance' : 'Add Maintenance'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _saveMaintenance,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Maintenance Type'),
                value: _selectedMaintenanceType,
                items: _maintenanceTypes.map((type) =>
                  DropdownMenuItem(value: type, child: Text(type))
                ).toList(),
                onChanged: (val) => setState(() => _selectedMaintenanceType = val),
                validator: (val) => val == null ? 'Select maintenance type' : null,
              ),
              TextFormField(
                controller: _mileageController,
                decoration: InputDecoration(labelText: 'Mileage'),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Enter mileage' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || val.isEmpty ? 'Enter price' : null,
              ),
              TextFormField(
                controller: _repairCenterController,
                decoration: InputDecoration(labelText: 'Car Repair Center'),
                validator: (val) => val == null || val.isEmpty ? 'Enter repair center' : null,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : 'Date: FCFA{_selectedDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text('Select Date'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}