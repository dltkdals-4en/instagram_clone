import 'package:flutter/material.dart';
import 'package:instagram_clone/login_page.dart';
import 'package:instagram_clone/tab_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return TabPage();
    return StreamBuilder<User>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if( snapshot.hasData){
          return TabPage(snapshot.data);
        }else{
          return LoginPage();
        }

      },
    );
  }
}
