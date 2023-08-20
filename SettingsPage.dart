import 'package:flutter/material.dart';
import 'package:ordering_app/Widgets/HelpPage.dart';
import 'package:ordering_app/Widgets/ThemeConfigPage.dart';

import 'LanguageRegionConfigPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // ignore: unused_field
  bool _isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Language & Region',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LanguageRegionConfigPage()),
              );
              // Naviguer vers la page de sélection de langue et de région
            },
          ),
          ListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                _isDarkModeEnabled = true; // Update as needed
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ThemeConfigPage(_updateTheme)),
                // Implémenter la logique pour activer/désactiver le mode sombre
              );
            },
          ),
          ListTile(
            title: Text(
              'Help & Assistance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Naviguer vers la page d'aide et d'assistance
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
        ],
      ),
    );
  }

  // Define the _updateTheme method to handle theme update
  void _updateTheme(bool isDarkModeEnabled) {
    setState(() {
      _isDarkModeEnabled = isDarkModeEnabled;
    });
    // Implement your lo
    // ... (votre code pour afficher la boîte de dialogue de déconnexion)
  }
}
