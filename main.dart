import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordering_app/Pages/LoginPage.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/CartPage.dart';
// ignore: unused_import
import 'Pages/Home.dart';
//import 'Pages/UserInfoPage.dart';
import 'Pages/UserInfoPage.dart';
import 'Widgets/ItemPage1.dart';
import 'Widgets/ItemPage2.dart';
import 'Widgets/ItemPage4.dart';
import 'Widgets/ItemPage5.dart';
import 'Widgets/Itempage3.dart';
import 'Widgets/ThemeConfigPage.dart';
//import 'Widgets/UserData.dart';
import 'package:ordering_app/Pages/HomePage.dart';

import 'Widgets/UserData.dart'; // Import your HomePage class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData.light();

  void _setAppTheme(bool isDarkMode) {
    setState(() {
      _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        title: 'Food Ordering App',
        debugShowCheckedModeBanner: false,
        theme: _themeData,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage(); // Utilisez la classe Home ici
            } else {
              return LoginForm();
            }
          },
        ),
        routes: {
          '/homePage': (context) =>
              HomePage(), // Assurez-vous que la route correspond au nom de la classe
          '/cart': (context) => HomePage(),
          "CartPage": (context) => CartPage(),
          "ItemPage1": (context) => ItemPage1(),
          "ItemPage2": (context) => ItemPage2(),
          "ItemPage3": (context) => ItemPage3(),
          "ItemPage4": (context) => ItemPage4(),
          "ItemPage5": (context) => ItemPage5(),
          "UserInfoPage": (context) => UserInfoPage(),
        },
        onGenerateRoute: (settings) {
          // Pass the setAppTheme method to other pages
          return MaterialPageRoute(
            builder: (context) {
              return ThemeConfigPage(_setAppTheme);
            },
          );
        },
      ),
    );
  }
}
