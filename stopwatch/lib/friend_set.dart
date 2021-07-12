import 'package:flutter/material.dart';
// 친구 초대, 친구 삭제, 친구 추가
class FriendSet extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => FriendSet(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<FriendSet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      title: 'Notice',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Friends Setting'),
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