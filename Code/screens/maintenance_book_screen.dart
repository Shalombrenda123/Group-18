import 'package:flutter/material.dart';
import 'add_maintenance_screen.dart';

class MaintenanceBookScreen extends StatefulWidget {
  const MaintenanceBookScreen({super.key});

  @override
  _MaintenanceBookScreenState createState() => _MaintenanceBookScreenState();
}

class _MaintenanceBookScreenState extends State<MaintenanceBookScreen> {
  final List<MaintenanceEntry> _entries = [];

  void _addEntry(MaintenanceEntry entry) {
    setState(() {
      _entries.add(entry);
    });
  }

  void _updateEntry(int index, MaintenanceEntry updatedEntry) {
    setState(() {
      _entries[index] = updatedEntry;
    });
  }

  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }

  void _navigateToAdd({MaintenanceEntry? entry, int? index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMaintenanceScreen(
          onSave: (newEntry) {
            if (index != null) {
              _updateEntry(index, newEntry);
            } else {
              _addEntry(newEntry);
            }
          },
          existingEntry: entry,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Maintenance Book')),
      body: _entries.isEmpty
          ? Center(child: Text('No maintenance records yet.'))
          : ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Card(
                  child: ListTile(
                    title: Text(entry.type),
                    subtitle: Text(
                      'Date: ${entry.date.toLocal().toString().split(" ")[0]}\nPrice: ${entry.price} FCFA'
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _navigateToAdd(entry: entry, index: index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteEntry(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAdd(),
      ),
    );
  }
}