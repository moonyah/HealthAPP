import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("moon"),
                accountEmail: Text("dltk789@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('#'),
                ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('#'),
                ),
              ],
              onDetailsPressed: () => {
                  print("clicked")
              },
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
            ),
            ListTile( // 마이페이지
              leading: Icon(Icons.home, color: Colors.grey[850],),
              title: Text("마이페이지"),
              trailing: Icon(Icons.add),
            ),
            ListTile( // 알림설정
              leading: Icon(Icons.settings, color: Colors.grey[850],),
              title: Text("알림설정"),
              trailing: Icon(Icons.add),
            ),
            ListTile( // 공지사항
              leading: Icon(Icons.question_answer, color: Colors.grey[850],),
              title: Text("공지사항"),
              trailing: Icon(Icons.add),
            ),
            ListTile( // 친구관리
              leading: Icon(Icons.question_answer, color: Colors.grey[850],),
              title: Text("친구관리"),
              trailing: Icon(Icons.add),
            ),
          ],
        )
      ),
    );
  }
}