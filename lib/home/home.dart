import 'package:bl_app/question/question.dart';
import 'package:bl_app/video/video.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomBarIndex = 0;

  var routes = <Widget>[
    // Home(),
    Question(),
    Video()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: routes[_bottomBarIndex],
          bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('问答')),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_label), title: Text('视频')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('我的'))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomBarIndex,
        onTap: (index){
          setState(() {
            _bottomBarIndex = index;
          });
        },
      ));
  }
}
