import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

// ignore: use_key_in_widget_constructors
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Gender? _character = Gender.male;

  TextEditingController fNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  Widget signupFullName() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: fNameController,
        obscureText: false,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.email,
            ),
            labelText: 'İsim ve Soyisminizi girin'),
      ),
    );
  }

  Widget signupEMail() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: mailController,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'E-postanızı girin',
          prefixIcon: Icon(
            Icons.lock,
          ),
        ),
      ),
    );
  }

  Widget signupPass() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: passController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Şifrenizi girin',
          prefixIcon: Icon(
            Icons.lock,
          ),
        ),
      ),
    );
  }

  Widget signupRePass() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: repassController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Şifrenizi Tekrar girin',
          prefixIcon: Icon(
            Icons.lock,
          ),
        ),
      ),
    );
  }

  Widget chooseGender() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 45,
            child: ListTile(
              title: const Text('Erkek'),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: _character,
                onChanged: (Gender? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 35,
            child: ListTile(
              title: const Text('Kadın'),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: _character,
                onChanged: (Gender? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget signUp() {
    CollectionReference userRef = _firestore.collection("Users");

    return Row(
      children: <Widget>[
        const SizedBox(
          height: 10.0,
          width: 5.0,
        ),
        Expanded(
            child: ElevatedButton(
          onPressed: () async {
            Map<String, dynamic> userData = {
              'name': fNameController.text,
              'eposta': mailController.text,
              'pass': passController.text,
            };
            await userRef.doc(fNameController.text).set(userData);
            try {
              // ignore: unused_local_variable
              UserCredential userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: mailController.text,
                      password: passController.text);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                // ignore: avoid_print
                print("The password provided is too weak");
              } else if (e.code == "email-already-in-use") {
                // ignore: avoid_print
                print('The account already exist for that email.');
              }
            } catch (e) {
              // ignore: avoid_print
              print(e);
            }
          },
          child: const Text('Kayıt Ol'),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Giriş Yap',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'İsim Soyisim',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      signupFullName(),
                      const SizedBox(height: 10.0),
                      const Text(
                        'E-posta',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      signupEMail(),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Şifre',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      signupPass(),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Şifre Tekrar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      signupRePass(),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Cinsiyet:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      chooseGender(),
                      signUp(),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
