import 'package:flutter/material.dart';
import 'package:GelBeraberOlsun/main.dart';

enum Gender { Male, Female }

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender? _character = Gender.Male;
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
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        height: 35.0,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              labelText: 'İsim ve Soyisminizi girin'),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'E-posta',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        height: 35.0,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-postanızı girin',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Şifre',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        height: 35.0,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Şifrenizi girin',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Cinsiyet:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Row(
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
                                      //
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
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                              width: 5.0,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              onPressed: () => {
                                /*print('Sign Up Button pressed!')*/
                                //Navigator.pushNamed(context, '/Signup'),
                              },
                              child: Text('Devam Et'),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            print('Forgot Butonuna Basıldı');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
