import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MechanicInfoScreen extends StatelessWidget {
  const MechanicInfoScreen({super.key});

  void _contactViaWhatsApp() async {
    const phone = '(237) 692 184 525';
    final whatsappUrl = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Diagnostics')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.garage),
              title: const Text('Moki Garage', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Garage Name'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mr. Brian Akengi'),
              subtitle: const Text('Mechanic'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('After Bakweri Town'),
              subtitle: const Text('Location'),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('8:00 AM - 7:00 PM'),
              subtitle: const Text('Working Hours'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('⭐️⭐️⭐️⭐️☆'),
              subtitle: const Text('Reviews'),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: _contactViaWhatsApp,
                icon: const Icon(Icons.message),
                label: const Text('Contact Us on WhatsApp'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}