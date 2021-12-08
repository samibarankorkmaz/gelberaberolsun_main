import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatelessWidget {
  TextEditingController nameCont = TextEditingController();
  TextEditingController ageCont = TextEditingController();
  TextEditingController meslekCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 20,
        title: Text(
          "PROFİLİ DÜZENLE",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.settings, size: 85),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(
                controller: nameCont,
                hintText: "İsminizi güncellemek için bir isim girin",
                prefixIcon: Icon(Icons.info),
              ),
              MyTextFormField(
                controller: meslekCont,
                hintText: "Mesleğinizi güncellemek için bir meslek girin",
                prefixIcon: Icon(Icons.security_sharp),
              ),
              MyTextFormField(
                controller: ageCont,
                hintText: "Yaşınızı Güncelleyin",
                prefixIcon: Icon(Icons.agriculture_sharp),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    onPressed: () async {
                      await Provider.of<Auth>(context, listen: false)
                          .updateDisplayName(nameCont.text);
                      if (nameCont.text.isNotEmpty &&
                          ageCont.text.isNotEmpty &&
                          meslekCont.text.isNotEmpty) {
                        Map<String,dynamic> map = {
                          "name": nameCont.text,
                          "yas": ageCont.text,
                          "meslek": meslekCont.text
                        };
                        User user= await Provider.of<Auth>(context, listen: false)
                          .getCurrentUser();
                          print("uid:${user.uid}");
                        CollectionReference ref=Provider.of<Auth>(context, listen: false).getRef("Users");
                        await ref.doc(user.uid).update(map);
                        
                      }

                      //Navigator.pushNamed(context, "/Profile");
                     // Navigator.pushNamedAndRemoveUntil(context, "/Profile", (route) => false);
                      Navigator.pop(context);
                    },
                    child: Text("Profili Güncelle"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;

  MyTextFormField({this.hintText, this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
