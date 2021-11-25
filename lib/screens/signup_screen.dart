import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:GelBeraberOlsun/main.dart';

enum Gender { Male, Female }

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Gender? _character = Gender.Male;

  TextEditingController fNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  Widget signupFullName() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: fNameController,
        obscureText: false,
        decoration: InputDecoration(
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: mailController,
        obscureText: false,
        decoration: InputDecoration(
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: passController,
        obscureText: true,
        decoration: InputDecoration(
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 35.0,
      child: TextField(
        controller: repassController,
        obscureText: true,
        decoration: InputDecoration(
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
              title: Text('Erkek'),
              leading: Radio<Gender>(
                value: Gender.Male,
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
              title: Text('Kadın'),
              leading: Radio<Gender>(
                value: Gender.Female,
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

    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
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
                UserCredential userCredential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: mailController.text,
                        password: passController.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print("The password provided is too weak");
                } else if (e.code == "email-already-in-use") {
                  print('The account already exist for that email.');
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text('Kayıt Ol'),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'İsim Soyisim',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      signupFullName(),
                      SizedBox(height: 10.0),
                      Text(
                        'E-posta',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      signupEMail(),
                      SizedBox(height: 10.0),
                      Text(
                        'Şifre',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      signupPass(),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Şifre Tekrar',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      signupRePass(),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Cinsiyet:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      chooseGender(),
                      signUp(),
                      SizedBox(
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
