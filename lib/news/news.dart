import 'dart:convert';

import 'package:bl_app/news/modal/category.dart';
import 'package:bl_app/news/tabBarContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    getTabMenu();
  }

  void getTabMenu() async {
    Response res = await Dio().get('http://118.24.19.83/category/list');
    // print(res);
    List d = res.data['data'];
    print(d);
    if (res.data['code'] == 0) {
      setState(() {
        _categoryList = d.map((value) => Category.fromJson(value)).toList();
      });
    }

    print('_categoryList: ${_categoryList}');
  }

  @override
  Widget build(BuildContext context) {
    return _categoryList.length > 0
        ? DefaultTabController(
            length: _categoryList.length,
            child: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    title: Container(
                      color: Colors.blue,
                      child: Container(
                        child: FlatButton(
                            splashColor: Colors.blue[300],
                            disabledColor: Colors.blue[300],
                            highlightColor: Colors.blue[300],
                            color: Colors.blue[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                Text(
                                  '搜索',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                          height: 46.0,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: TabBar(
                              onTap: (index) {
                                print(index);
                              },
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 30.0),
                              indicatorColor: Colors.blue[600],
                              tabs: _categoryList.map((category) {
                                return Text(category.name);
                              }).toList())),
                    )),
                body: TabBarView(children:  _categoryList.map((category){
                  return TabBarContent(category: category);
                }).toList())))
        : SizedBox();
  }
}
