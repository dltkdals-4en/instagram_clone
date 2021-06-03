import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('root_page created');
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder<User>(
      // stream: FirebaseAuth.instance.authStateChanges(),
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else {
          if (snapshot.hasData) {
            return TabPage(snapshot.data);
          }
          return LoginPage();
        }
      },
    );
  }
}