import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OBDCodeScreen extends StatefulWidget {
  const OBDCodeScreen({super.key});

  @override
  _OBDCodeScreenState createState() => _OBDCodeScreenState();
}

class _OBDCodeScreenState extends State<OBDCodeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allCodes = ['P0300', 'P0420', 'P0171', 'P0455', 'P0128'];
  List<String> filteredCodes = [];

  @override
  void initState() {
    super.initState();
    filteredCodes = allCodes;
  }

  void _search(String query) async {
    final code = query.trim().toUpperCase();
    if (code.isEmpty) return;

    final url = 'https://www.obd-codes.com/$code/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch URL')),
      );
    }
  }

  void _filter(String query) {
    setState(() {
      filteredCodes = allCodes
          .where((code) => code.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OBD Codes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filter,
                    onSubmitted: _search,
                    decoration: InputDecoration(
                      labelText: 'Search OBD Code',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => _search(_searchController.text),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: filteredCodes.isEmpty
                  ? Center(child: Text('No suggestions found'))
                  : ListView.builder(
                      itemCount: filteredCodes.length,
                      itemBuilder: (context, index) {
                        final code = filteredCodes[index];
                        return ListTile(
                          title: Text(code),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () => _search(code),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
