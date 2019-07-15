import 'package:flutter/material.dart';
import 'package:flutter_app/second.dart';
import 'package:flutter_app/tab_widget.dart';
import 'package:flutter_app/third.dart';

class HomeTabView extends StatefulWidget {
  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  static final List<String> tabs = ['工作台', '顾客', '发现', '我的'];
  List<Widget> tab_list = [
    Tab(
      icon: Icon(Icons.star),
      child: Text(tabs[0]),
    ),
    Tab(
      child: Text(tabs[1]),
    ),
    Tab(
      child: Text(tabs[2]),
    ),
    Tab(
      child: Text(tabs[3]),
    ),
  ];

  ///渲染Tab 对应页面
  _renderPage() {
    return [
      new SecondPage(),
      new Third(),
      new Text('页面三'),
      new Text('页面四'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GSYTabBarWidget(
        type: GSYTabBarWidget.BOTTOM_TAB,

        ///渲染tab
        tabItems: tab_list,

        ///渲染页面
        tabViews: _renderPage(),
        backgroundColor: Colors.black45,
        indicatorColor: Colors.white,
        title: new Text("GSYGithubFlutter"));
  }
}
