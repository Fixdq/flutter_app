import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ListViewSliverSimpleView extends StatefulWidget {
  @override
  _ListViewSliverSimpleViewState createState() =>
      _ListViewSliverSimpleViewState();
}

class _ListViewSliverSimpleViewState extends State<ListViewSliverSimpleView> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  int _count = 20;
  bool _enableRefresh = true;
  bool _enableLoad = true;

  @override
  void initState() {
    super.initState();

    /// 初始化监听
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  /// 刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _count = 20;
      });

    });
  }

  /// 加载更多
  Future<void> _onLoad() async {
    await Future.delayed(Duration(seconds: 2), (){
      setState(() {
        _count += 20;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyRefresh Simple'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: EasyRefresh.custom(
            header: ClassicalHeader(),
            footer: ClassicalFooter(),
            onRefresh: _onRefresh,
            onLoad: _onLoad,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 50.0,
                      child: ListTile(
                        title: Text('$index'),
                      ),
                    );
                  },
                  childCount: _count,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
