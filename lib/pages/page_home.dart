import 'package:flutter/material.dart';
import 'package:flutter_app/common/router/application.dart';
import 'package:flutter_app/common/router/routers.dart';

class HomePage extends StatelessWidget {
  static final String sName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(5.0),
        children: <Widget>[
          MyListTile(
            icon:Icons.ac_unit,
            title: '登录',
            path: Routers.login,
          ),
          MyListTile(
            icon:Icons.open_with,
            title: '主题',
            path: Routers.theme,
          ),
          MyListTile(
            icon:Icons.camera,
            title: 'ListView默认',
            path: Routers.listview,
          ),
        ],
      ),
    );
  }
}


class MyListTile extends StatelessWidget{

  final IconData icon;
  final String title;
  final String path;

  MyListTile({this.icon, this.path, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Application.router.navigateTo(context, path);
      },
    );
  }
}