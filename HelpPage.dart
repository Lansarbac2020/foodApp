import 'package:flutter/material.dart';
import 'package:ordering_app/Widgets/ContactFormPage.dart';

import 'FAQPage.dart';
import 'OnlineSupportPage.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Help & Assistance'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'FAQ (Frequently Asked Questions)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
              // Naviguer vers la section FAQ
            },
          ),
          ListTile(
            title: Text(
              'Online support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Naviguer vers la section Support en ligne
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnlineSupportPage()),
              );
            },
          ),
          ListTile(
            title: Text(
              'Contact form',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactFormPage()),
              );
              // Naviguer vers la section Formulaire de contact
            },
          ),
          // Ajoutez d'autres options ici
        ],
      ),
    );
  }
}
