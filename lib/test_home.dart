

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'detail_post_page.dart';
import 'package:instagram_clone/create_page.dart';

class TestHome extends StatefulWidget {
  const TestHome(this.user);
  final User user;
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final ButtonStyle style = ElevatedButton.styleFrom(

    );
    return Padding(
      padding: EdgeInsets.all(8.0),

          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환영합니다.', style: TextStyle(fontSize: 22.0),),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요.', style: TextStyle(fontSize: 12.0)),
                Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 260.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(4.0)),
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  widget.user.photoURL),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Text(widget.user.email,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          Padding(padding: EdgeInsets.all(3.0)),
                          Text(widget.user.displayName),
                          Padding(padding: EdgeInsets.all(8.0)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(widget.user.photoURL,fit: BoxFit.cover ,),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network('',fit: BoxFit.cover ,),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network('',fit: BoxFit.cover ,),
                              ),
                              Padding(padding: EdgeInsets.all(1.0)),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(4.0)),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('팔로우'),
                            style: style,
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}








