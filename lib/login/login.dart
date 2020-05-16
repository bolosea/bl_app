import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("登录"),
        )),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mobile_screen_share,
                        color: Colors.grey,
                      ),
                      hintText: '请输入手机号',
                      hintStyle: TextStyle(fontSize: 14.0),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12))),
                  keyboardType: TextInputType.number,
                ),
                color: Colors.white,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                              hintText: '请输入验证码',
                              hintStyle: TextStyle(fontSize: 14.0),
                              border: InputBorder.none),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromRGBO(237, 237, 237, 1),
                        ),
                        child: Text("获取验证码"),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    disabledColor: Colors.blue[100],
                    color: Colors.blue,
                    onPressed: () {
                      print('登录。。');
                    },
                    // shape: CircleBorder(side: BorderSide(color: Colors.red)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
            ],
          ),
        ));
  }
}
