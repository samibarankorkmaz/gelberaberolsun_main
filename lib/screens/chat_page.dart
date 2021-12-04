import 'package:flutter/material.dart';
import 'package:gelberaberolsun/data/user_json.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Mesajlar",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.search),
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Flexible(
                      child: TextField(
                        //Controller Eklenecek
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Kişilerde Ara"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(usersList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: const Offset(0, 1),
                          )
                        ],
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    //shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            usersList[index]["img"]),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                usersList[index]["name"],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                usersList[index]["message"],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
