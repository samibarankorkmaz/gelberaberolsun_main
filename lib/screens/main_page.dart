// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gelberaberolsun/data/post_json.dart';
import 'package:gelberaberolsun/services/Auth.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    print("Main");
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            //
          });
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 1),
              ),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Icon(
              Icons.add_box_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Gel Beraber Olsun',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {
                  //Bildirim ekranına gidecek.
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.login_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    await Provider.of<Auth>(context, listen: false).singOut();
                  })
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Güncel İstekler",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: List.generate(postsList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 2,
                                blurRadius: 15,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            image: DecorationImage(
                                image:
                                    NetworkImage(postsList[index]['postImg']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              postsList[index]['img']),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              postsList[index]['name'],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              postsList[index]['time'],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Daha Fazla",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  //isteğin içeriğinin tamamını okut
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.read_more,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: const Offset(0, 1),
                                        )
                                      ]),
                                  child: Text(
                                    postsList[index]['request'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
