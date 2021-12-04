import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final icon = CupertinoIcons.moon_stars;
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 1)),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                      Navigator.pushNamed(context, '/Main');
                    });
                  },
                  child: const Icon(
                    Icons.home,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                      //Mesajlaşma Kısmına gidecek.
                      Navigator.pushNamed(context, '/Chat');
                    });
                  },
                  child: const Icon(
                    Icons.message,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                      //Favoriler kısmına gidecek(Eğer yapmaya karar verirsek)
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                      Navigator.pushNamed(context, '/Profile');
                    });
                  },
                  child: const Icon(
                    Icons.person,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Container(
                      width: 145,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Kullanıcı",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "@kullanıcı_",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),
          preferredSize: const Size.fromHeight(250),
        ),
        body: Container());
  }
}
