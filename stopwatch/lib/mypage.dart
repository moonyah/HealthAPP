import 'package:flutter/material.dart';
// 닉네임, 상태메세지, 로그아웃, 탈퇴하기
class MyPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => MyPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      title: 'My Page',
      home: Scaffold(
        appBar: AppBar(
            title: Text('My Page'),
            leading:
            new IconButton(
                icon: new Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }
            )
        ),
      ),
    );
  }
}