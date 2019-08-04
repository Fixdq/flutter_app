import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewSliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewSliverView(),
    );
  }
}

class ListViewSliverView extends StatefulWidget {
  @override
  _ListViewSliverViewState createState() => _ListViewSliverViewState();
}

class _ListViewSliverViewState extends State<ListViewSliverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            /// appbar 是否停留在顶部
//            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("推一下试试"),
              background: Image.network(
                "http://b-ssl.duitang.com/uploads/item/201804/24/20180424214451_5lJat.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
