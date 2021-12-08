// ignore_for_file: avoid_print, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String yas, meslek;

  @override
  void initState() {
    // ignore: todo
    //TODO: implement initState
    super.initState();
    Provider.of<Auth>(context, listen: false)
        .getDocument("Users")
        .then((value) {
      meslek = value["meslek"];
      yas = value["yas"];
      print("meslek:$meslek    yas:$yas");

      setState(() {});
    });
  }

  /*var vari=Provider.of<Auth>(context,listen: false).getDocument("Users");
                      print(vari["name"]);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                      style: BorderStyle.solid),
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.cyan],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                right: MediaQuery.of(context).size.width / 2.9,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 65,
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, "/Profile Edit Page");
                    },
                    child: Text(
                      "PROFİLİ GÜNCELLE",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: BorderSide(width: 2, color: Colors.orange),
                    ),
                  )),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    Provider.of<Auth>(context, listen: false)
                        .getCurrentUserName(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Text(meslek, style: TextStyle(fontSize: 15))),
                SizedBox(height: 20),
                Center(child: Text("Yaş-$yas", style: TextStyle(fontSize: 15)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
