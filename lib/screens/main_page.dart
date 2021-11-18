import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.search),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.message),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.person),
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
