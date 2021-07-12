import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => Notice(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      title: 'Notice',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Notice'),
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