import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/router/application.dart';
import 'package:flutter_app/common/router/routers.dart';

class FListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: FixdListView(),
    );
  }
}

class FixdListView extends StatefulWidget {
  @override
  _FixdListViewState createState() => _FixdListViewState();
}

class _FixdListViewState extends State<FixdListView> {
  final Map<String, String> listTitles = {
    '基本使用': Routers.listviewbase,
    '下拉刷新': Routers.listviewpull,
    '上拉加载': Routers.listviewload,
    'Sliver': Routers.listviewsliver,
  };

  /// 获取所有item 元素
  List<Widget> getChilds(Map<String, String> titles) {
    List<Widget> childs = [];

    /// 遍历生成item
    titles.forEach((title, path) {
      childs.add(ListTile(
        leading: Icon(Icons.assistant_photo,color: Colors.red,),
        trailing: Icon(Icons.chevron_right),
        title: Text(title),
        onTap: () {
          Application.router.navigateTo(context, path);
        },
      ));
    });
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      itemExtent: 50.0,
      children: getChilds(listTitles),
    );
  }
}
