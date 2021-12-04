import 'package:flutter/material.dart';
import 'package:gelberaberolsun/screens/chat_page.dart';
import 'package:gelberaberolsun/screens/login_screen.dart';
import 'package:gelberaberolsun/screens/profile_page.dart';
import 'package:gelberaberolsun/screens/sign_up_page.dart';
import 'package:gelberaberolsun/screens/signup_screen.dart';
import 'package:gelberaberolsun/screens/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:gelberaberolsun/widgets/control_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Login Page',
        debugShowCheckedModeBanner: false,
        home: ControlWidget(),
        routes: {
          '/Login': (context) => LoginScreen(),
          '/Signup': (context) => SignUp(),
          '/Main': (context) => MainPage(),
          '/Chat': (context) => ChatPage(),
          '/Profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}
