import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordering_app/Pages/UserInfoPage.dart';
import 'package:ordering_app/Widgets/SettingsPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../Pages/UserInfoPage.dart';
import 'UserData.dart';
import 'package:image_picker/image_picker.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    userData.loadUserData(); // Load user data when building the drawer

    return Drawer(
      child: ListView(
        children: [
          Consumer<UserData>(
            builder: (context, userData, child) {
              return DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text(
                    userData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  accountEmail: Text(
                    userData.email,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  currentAccountPicture: GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedImage =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (pickedImage != null) {
                        Provider.of<UserData>(context, listen: false)
                            .updateImagePath(pickedImage.path);
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: userData.imagePath != null
                          ? FileImage(File(userData.imagePath!))
                              as ImageProvider<Object>
                          : AssetImage("lib/assets/images/guest_avatar.jpg"),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_box,
              color: Colors.red,
            ),
            title: Text(
              "MY ACCOUNT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfoPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.red,
            ),
            title: Text(
              "SETTINGS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),

          // ... (other drawer items)
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "LOG OUT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('imagePath');

                // Add your additional logout logic here

                SystemNavigator.pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
