import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Alarm(),
  ));
}

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
  bool isSwitched = false;

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
        body: Center(
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.yellow,
            activeColor: Colors.orangeAccent,
          ),
        )
      ),
    );
  }
}