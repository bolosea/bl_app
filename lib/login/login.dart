import 'dart:async';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String msg = '获取验证码';
  int time = 60;
  Timer timer;

  String phone;
  String code;

  void _getValidateCode() {
    if (timer != null && timer.isActive) {
      return;
    }
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (time == 0) {
          msg = '获取验证码';
          time = 60;
          return timer.cancel();
        }
        time = time - 1;
        msg = "$time(s)";
      });
    });
  }

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
                  onChanged: (value){
                    setState((){
                      phone = value;
                    });
                  },
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
                          onChanged: (value){
                            setState(() {
                              code = value;
                            });
                          },
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
                      GestureDetector(
                        onTap: () {
                          _getValidateCode();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color.fromRGBO(237, 237, 237, 1),
                          ),
                          child: Text("$msg"),
                        ),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
