import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeConfigPage extends StatefulWidget {
  final Function(bool) setAppTheme;

  ThemeConfigPage(this.setAppTheme);

  @override
  _ThemeConfigPageState createState() => _ThemeConfigPageState();
}

class _ThemeConfigPageState extends State<ThemeConfigPage> {
  bool _isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkModeEnabled') ?? false;
    setState(() {
      _isDarkModeEnabled = isDarkMode;
    });
  }

  Future<void> _updateThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Configuration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _isDarkModeEnabled,
              onChanged: (value) async {
                setState(() {
                  _isDarkModeEnabled = value;
                });
                await _updateThemePreference(value);
                _updateTheme(value);
              },
            ),
            Text('Enable Dark Mode'),
          ],
        ),
      ),
    );
  }

  void _updateTheme(bool isDarkModeEnabled) {
    setState(() {
      _isDarkModeEnabled = isDarkModeEnabled;
    });
    widget.setAppTheme(isDarkModeEnabled);
    _updateThemePreference(isDarkModeEnabled);
  }
}
