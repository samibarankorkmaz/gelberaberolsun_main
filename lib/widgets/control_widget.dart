// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gelberaberolsun/screens/login_screen.dart';
import 'package:gelberaberolsun/screens/main_page.dart';
import 'package:gelberaberolsun/screens/sign_up_page.dart';
import 'package:gelberaberolsun/screens/signup_screen.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class ControlWidget extends StatefulWidget {
  const ControlWidget({Key key}) : super(key: key);

  @override
  _ControlWidgetState createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return snapshot.data != null ? const MainPage() : LoginScreen();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      stream: Provider.of<Auth>(context, listen: false).authStateChanges(),
    );
  }
}
