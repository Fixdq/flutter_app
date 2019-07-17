import 'package:flutter/material.dart';
import 'package:flutter_app/common/utils/navigator_utils.dart';
import 'package:flutter_app/pages/page_login.dart';
import 'package:flutter_app/pages/page_theme.dart';

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
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('登录'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              NavigatorUtils.NavigatorRouter(context,LoginPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.open_with),
            title: Text('主题'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              NavigatorUtils.NavigatorRouter(context,ThemeChange());
            },
          ),
        ],
      ),
    );
  }
}
