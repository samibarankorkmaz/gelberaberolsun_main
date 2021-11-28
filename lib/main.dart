import 'package:flutter/material.dart';
import 'package:gelberaberolsun/screens/login_screen.dart';
import 'package:gelberaberolsun/screens/signup_screen.dart';
import 'package:gelberaberolsun/screens/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/Login': (context) => LoginScreen(),
        '/Signup': (context) => SignupScreen(),
        '/Main': (context) => const MainPage(),
      },
    );
  }
}
