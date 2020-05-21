import 'package:bl_app/news/modal/category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'modal/article.dart';

class TabBarContent extends StatefulWidget {
  final Category category;

  TabBarContent({this.category, Key key}) : super(key: key);

  @override
  _TabBarContentState createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  List<Article> _articles = [];
  ScrollController _controller = ScrollController();
  int currPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print(widget.categoryId);
    getListByPage();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        currPage = currPage + 1;
        getListByPage();
        print('滑动到了最底部');
      }
    });
  }

  void getListByPage() async {
    print('parentId: ${widget.category.parentId}  categoryId ${widget.category.id} ');
    String url =
        "http://118.24.19.83/article/listByPage?currPage=${currPage}&pageSize=6";
    if (widget.category.parentId != null) {
      url += "&categoryId=${widget.category.parentId}";
      
    }
    if (widget.category.parentId == null && widget.category.id !=7 ) {
      url += "&parentId=${widget.category.id}";
    }
    print('url: ${url}');
    Response res = await Dio().get(url);
    List d = res.data['data']['pages'];
    print('getListByPage: ${d}');
    if (mounted) {
      setState(() {
        if (res.data['code'] == 0) {
          _articles.addAll(d.map((value) {
            return Article.fromJson(value);
          }).toList());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      // color: Colors.yellow[300],
      child: ListView.builder(
          controller: _controller,
          itemCount: _articles.length,
          itemBuilder: (context, i) {
            print('i: ${i}');
            return _articles.length > 0
                ? Card(article: _articles[i])
                : SizedBox();
          }),
    );
  }
}

class Card extends StatefulWidget {
  Card({this.article});
  final Article article;

  @override
  State<StatefulWidget> createState() {
    return _CardState();
  }
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(widget.article.createTime);
    print(date.toLocal().toString().substring(0, 10));
    return Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300])),
        color: Colors.white,
      ),
      // height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "${widget.article.title}",
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      children: [
                    TextSpan(
                        text: "${widget.article.category['name']}  ",
                        style: TextStyle(color: Colors.red)),
                    TextSpan(text: '${widget.article.author}  '),
                    TextSpan(text: '87评论  '),
                    TextSpan(
                        text: '${date.toLocal().toString().substring(0, 10)}  ')
                  ]))
            ],
          )
        ],
      ),
    );
  }
}
