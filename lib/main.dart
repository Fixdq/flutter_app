import 'package:flutter/material.dart';

import 'hometabview.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Home(),
        '/tabview':(context)=>HomeTabView(),
      },
    );
  }
}


class Home extends StatelessWidget {
  static const String _title = 'Flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/tabview');
//                Navigator.pushNamed(context, '/tabview');
              },
              color: Colors.greenAccent,
              child: Text('HOME'),
            ),
          ],
        ),
      ),
    );
  }
}
