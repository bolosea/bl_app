import 'package:flutter/material.dart';

class TabBarContent extends StatefulWidget {
  final int categoryId;

  TabBarContent({this.categoryId, Key key}) : super(key: key);

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

  void getListByPage() async {}

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}

class Card extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardState();
  }
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.yellow[300],
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              // color: Colors.blue,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300])
                ),
              ),
              // height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("DOCKER最佳实践",style: TextStyle(fontSize: 18),),
                  Row(
                    children: <Widget>[
                      RichText(text: TextSpan(
                        style: TextStyle(color: Colors.grey[600],fontSize: 16,fontWeight: FontWeight.normal),
                        children: [
                          TextSpan(text: "置顶  ",style: TextStyle(color: Colors.red)),
                          TextSpan(text: 'miketech.it  '),
                          TextSpan(text: '87评论  '),
                          TextSpan(text: '一小时前  ')
                        ]
                      ))
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
