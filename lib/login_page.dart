import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram Clone',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(50.0),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                _handleSignIn();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> _handleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print('google user = ' + googleUser.toString());

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    print('google auth = ' + googleAuth.toString());
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print('google credential = ' + credential.toString());


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}