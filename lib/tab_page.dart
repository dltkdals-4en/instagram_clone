import 'package:flutter/material.dart';
import 'package:instagram_clone/account_page.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/test_home.dart';

class TabPage extends StatefulWidget {
  final User user;
  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex =0;
  List _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
      TestHome(widget.user),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: _pages[_selectedIndex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label:'home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label:'search'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label:'account'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label:'testhome'
            ),
        ],
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
