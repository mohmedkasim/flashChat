import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/roundedButton.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = "loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 100,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                username = value;
              },
              decoration: kTextField.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextField.copyWith(
                  hintText: 'Enter your password.',
                )),
            SizedBox(
              height: 24.0,
            ),
            CustomButton(
                text: "Log In",
                color: Colors.lightBlueAccent,
                onPress: () async {
                  try {
                    final login = await _auth.signInWithEmailAndPassword(
                        email: username, password: password);
                    if (login != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    } else {
                      print('login wrong');
                    }
                  } catch (x) {
                    print('long wrong');
                    print(x);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
