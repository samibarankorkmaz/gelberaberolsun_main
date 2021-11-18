import 'package:flutter/material.dart';
import 'package:mobil_proje/screens/login_screen.dart';
import 'package:mobil_proje/screens/signup_screen.dart';
import 'package:mobil_proje/screens/main_page.dart';

void main() {
  runApp(MyApp());
}

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
        '/Main': (context) => MainPage(),
      },
    );
  }
}
