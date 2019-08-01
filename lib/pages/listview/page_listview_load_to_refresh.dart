import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewLoadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView基本使用"),
      ),
      body: ListViewLoadView(),
    );
  }
}

class ListViewLoadView extends StatefulWidget {
  @override
  _ListViewLoadViewState createState() => _ListViewLoadViewState();
}

class _ListViewLoadViewState extends State<ListViewLoadView> {
  List _list  = [];
  ScrollController _controller = ScrollController();
  bool isLoading = false;
  int pageSize = 0;


  @override
  void initState() {
    super.initState();
    /// 初始化数据
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    /// 注销监听
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          itemCount: _list.length + 1,
          itemExtent: 50.0,
          controller: _controller,
          itemBuilder: _renderRow),
    );
  }


  /// 渲染单行数据
  Widget _renderRow(BuildContext context, int index) {
    if (index < _list.length){
      return ListTile(
        title: Text(
          '$index',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    return _getMoreWidget();

  }

  /// 加载更多时显示的组件,给用户提示
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(strokeWidth: 1.0,)
          ],
        ),
      ),
    );
  }




  Future<void> _onRefresh() async{
    await Future.delayed(Duration(seconds: 2),(){
      Fluttertoast.showToast(msg: "success");
    });
  }

  Future getData() async{
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        _list = List.generate(15, (i) => "初始化数据$i" );
      });
    });
  }
}
