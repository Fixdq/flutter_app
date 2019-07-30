import 'package:flutter/material.dart';

class ListViewBasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView基本使用"),
      ),
      body: ListViewBaseView(),
    );
  }
}

class ListViewBaseView extends StatefulWidget {
  @override
  _ListViewBaseViewState createState() => _ListViewBaseViewState();
}

class _ListViewBaseViewState extends State<ListViewBaseView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              '$index',
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }
}
