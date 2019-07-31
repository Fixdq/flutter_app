import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewPullPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView基本使用"),
      ),
      body: ListViewPullView(),
    );
  }
}

class ListViewPullView extends StatefulWidget {
  @override
  _ListViewPullViewState createState() => _ListViewPullViewState();
}

class _ListViewPullViewState extends State<ListViewPullView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          itemExtent: 50.0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                '$index',
                style: TextStyle(color: Colors.red),
              ),
            );
          }),
    );
  }


  Future<void> _onRefresh() async{
    await Future.delayed(Duration(seconds: 2),(){
      Fluttertoast.showToast(msg: "success");
    });
  }
}
