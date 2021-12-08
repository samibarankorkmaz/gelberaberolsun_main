// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final _signUpKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController meslekController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Create Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    controller: nameController,
                    label: "Full Name",
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    inputType: TextInputType.emailAddress,
                    label: "Email Adress",
                    controller: emailController,
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    label: "Meslek",
                    controller: meslekController,
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                    label: "Yaş",
                    controller: ageController,
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
                      inputType: TextInputType.visiblePassword,
                      label: "Password",
                      controller: passwordController),
                  SizedBox(height: 20),
                  MyTextFormField(
                    label: "Password Again",
                    controller: passwordAgainController,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_signUpKey.currentState.validate() &&
                          passwordController.text ==
                              passwordAgainController.text) {
                        await Provider.of<Auth>(context, listen: false)
                            .createUserWithEmailAndPassword(
                                emailController.text, passwordController.text);
                        String uid =
                            await Provider.of<Auth>(context, listen: false)
                                .getCurrentUser()
                                .uid;
                        await Provider.of<Auth>(context, listen: false)
                            .updateDisplayName(nameController.text);

                        await Provider.of<Auth>(context, listen: false)
                            .createUser({
                          "name": nameController.text,
                          "id": uid,
                          "yas": ageController.text,
                          "meslek": meslekController.text
                        });

                        Navigator.pop(context);
                      }
                    },
                    child: Text('SIGN UP'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(350, 50),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String label, infoMessage;
  final TextEditingController controller;
  final Function validator;
  final TextInputType inputType;

  MyTextFormField(
      {Key key,
      @required this.label,
      this.controller,
      this.infoMessage,
      this.validator,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      validator: (value) {
        if (label.contains("Email") && !EmailValidator.validate(value)) {
          return "Geçerli Bir Mail Adresi Giriniz.";
        } else if (label.contains("Password") && value.length < 6) {
          return "Şifre 6 Haneden Az Olamaz.";
        } else if (label.contains("Name") && value.isEmpty) {
          return "Bu Alan Boş Bırakılamaz.";
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(35),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
