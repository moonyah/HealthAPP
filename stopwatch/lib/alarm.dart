import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => Alarm(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      title: 'Alarm',
      home: Scaffold(
        appBar: AppBar(
            title: Text('알림 설정'),
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