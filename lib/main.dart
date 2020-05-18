import 'package:bl_app/question/question.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'login/login.dart';
import 'news/news.dart';
import 'video/video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '菠萝君',
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/news": (context)=>News(),
        "/question": (context)=>Question(),
        "/video": (context) => Video()
      },
    );
  }
}
