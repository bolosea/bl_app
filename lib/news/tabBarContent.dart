import 'package:flutter/material.dart';

class TabBarContent extends StatefulWidget {

  final int categoryId;

  TabBarContent({this.categoryId,Key key}) : super(key: key);
  
  @override
  _TabBarContentState createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('${widget.categoryId}'),
    );
  }
}