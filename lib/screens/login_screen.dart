import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  Widget otherLoginMethods() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            // ignore: avoid_print
            onTap: () => print("Facebook ile giriş yap"),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: (6.0),
                    ),
                  ],
                  image: DecorationImage(image: AssetImage('logos/fb.png'))),
            ),
          ),
          GestureDetector(
            // ignore: avoid_print
            onTap: () => print("Google ile giriş yap"),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: (6.0),
                    ),
                  ],
                  image: DecorationImage(image: AssetImage('logos/g.jpg'))),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Main');
          },
          child: const Text('Giriş Yap'),
        ),
        const SizedBox(
          width: 100.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Signup');
          },
          child: const Text("Kaydol"),
        )
      ],
    );
  }

  Widget rememberMe() {
    return Row(
      children: <Widget>[
        Checkbox(
            checkColor: Colors.black,
            activeColor: Colors.white,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }),
        const Text(
          "Beni Hatırla",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
        )
      ],
    );
  }

  Widget emailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "E-posta",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(color: Colors.white),
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: "E-posta adresinizi girin:"),
          ),
        )
      ],
    );
  }

  Widget passwordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Şifre",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(color: Colors.white),
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: "Şifrenizi girin:"),
          ),
        ),
      ],
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Şifrenizi mi unuttunuz?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          // ignore: avoid_print
          print("Forgot butonuna basıldı.");
        },
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  emailForm(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  passwordForm(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  forgotPassword(),
                  rememberMe(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  actionButtons(),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        '-VEYA-',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Şununla giriş yap',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      otherLoginMethods()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
