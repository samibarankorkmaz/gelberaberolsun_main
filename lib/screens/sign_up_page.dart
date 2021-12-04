import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final _signUpKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef = _firestore.collection("Users");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Create Account"),
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
                    "Create Account",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  MyTextFormField(
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
                      Map<String, dynamic> userData = {
                        'name': nameController.text,
                        'eposta': emailController.text,
                        'pass': passwordController.text,
                      };
                      await userRef.doc().set(userData);
                      if (_signUpKey.currentState.validate() &&
                          passwordController.text ==
                              passwordAgainController.text) {
                        await Provider.of<Auth>(context, listen: false)
                            .createUserWithEmailAndPassword(
                                emailController.text, passwordController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("SIGN UP"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: Size(350, 50),
                      elevation: 5,
                    ),
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
      {@required this.label,
      this.controller,
      this.infoMessage,
      this.validator,
      this.inputType});

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
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
