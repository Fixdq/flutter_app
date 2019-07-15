import 'package:flutter/material.dart';
import 'package:flutter_app/pull_widget.dart';


class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =  GlobalKey<RefreshIndicatorState>();
  final PullLoadWidgetConfig _config = PullLoadWidgetConfig();
  ///控制列表滚动和监听
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
//    _config.needLoadMore=true as ValueNotifier<bool>;
  }
  /// 模拟IOS下拉显示刷新
  showRefreshLoading() {
    ///直接触发下拉
    new Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.animateTo(-141,
          duration: Duration(milliseconds: 600), curve: Curves.linear);
      return true;
    });
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');

    if (_config.dataList.lenth == 0){
      _config.needLoadMore = false;
      showRefreshLoading();
    }
    _config.dataList = [1,2];
    super.didChangeDependencies();
  }

  refresh(){

    var dataList = [1,2,3,4];
    _config.needLoadMore = (0 != dataList.length) as ValueNotifier<bool>;
    _config.dataList = dataList;
    return dataList;
  }

  load(){
    print('load');
    var dataList = [1,2,3,4];
    _config.needLoadMore = (0 != dataList.length) as ValueNotifier<bool>;
    _config.dataList.addAll(dataList);
    return dataList;
  }


  ///下拉刷新数据
  Future<void> requestRefresh() async {

    //await Future.delayed(Duration(seconds: 1));
    return await load();
  }
  ///上拉更多请求数据
  Future<void> requestLoadMore() async {

    //await Future.delayed(Duration(seconds: 1));
    _config.needLoadMore = (1==2) as ValueNotifier<bool>;
    return refresh();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview'),
      ),
      body: FixdqPullLoadWidget(
        itemBuilder: (BuildContext context,int index){
          return Text(_config.dataList[index].toString());
        },
        scrollController: scrollController,
        key: refreshIndicatorKey,
        config: _config,
        onLoadMore:requestLoadMore ,
        onRefresh: requestRefresh,
      ),
    );
  }
}
