import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier {
  String name = 'User Name';
  String email = 'User Email';
  String? imagePath;

  // ... (existing methods)

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? 'User Name';
    email = prefs.getString('email') ?? 'User Email';
    imagePath = prefs.getString('imagePath');
    notifyListeners();
  }

  Future<void> updateUserInfo(String newName, String newEmail) async {
    name = newName;
    email = newEmail;
    await _saveUserData();
    notifyListeners();
  }

  Future<void> updateImagePath(String newPath) async {
    imagePath = newPath;
    await _saveUserData();
    notifyListeners();
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('imagePath', imagePath ?? '');
  }

  // Custom method to perform an action
  Future<void> performCustomAction() async {
    // Implement your custom action here
    // For example, you could log some information or perform some network call
  }
}
