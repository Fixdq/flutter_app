import 'package:flutter/material.dart';
import 'package:flutter_app/widget/refresh_first.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ListViewSliverSimpleView extends StatefulWidget {
  @override
  _ListViewSliverSimpleViewState createState() =>
      _ListViewSliverSimpleViewState();
}

class _ListViewSliverSimpleViewState extends State<ListViewSliverSimpleView> {
  EasyRefreshController _controller;
  ScrollController _scrollController;


  int _count = 0;
  // 首次刷新
  bool _firstRefresh = true;
  // 开启刷新
  bool _enableRefresh = true;
  // 开始加载
  bool _enableLoad = true;
  // 顶部回弹
  bool _topBouncing = true;
  // 底部回弹
  bool _bottomBouncing = true;

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
            firstRefresh: _firstRefresh,
            firstRefreshWidget: Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                  child: SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child:  SpinKitFadingFour(
                                color: Colors.red, shape: BoxShape.rectangle),
                          ),
                          Container(
                            child:
                            Text('loading'),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
            topBouncing: _topBouncing,
            bottomBouncing: _bottomBouncing,
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


