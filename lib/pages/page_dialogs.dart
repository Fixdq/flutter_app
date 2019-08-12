import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
//  Map<String, Function> listTitles = {
//    '简单': _simpleDiaolog,
//  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('SimpleDialog'),
            onPressed: () {
              _simpleDialog(context);
            },
          ),
          RaisedButton(
            child: Text('SimpleDialog'),
            onPressed: () {
              _simpleDialog(context);
            },
          )
        ],
      ),
    );
  }



  /// SimpleDialog
  _simpleDialog(BuildContext context) {
    /// 标题
    var _title = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network(
          'https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=ad628627aacc7cd9e52d32d909032104/32fa828ba61ea8d3fcd2e9ce9e0a304e241f5803.jpg',
          height: 30.0,
          width: 30.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text('SimpleDialog'),
      ],
    );

    showDialog(
      context: context,
      /// 点击外部阴影，弹窗是否消失 默认 true
      barrierDismissible: true,
      builder: (context) {
        return SimpleDialog(
          title: _title,
          children: <Widget>[
            SimpleDialogOption(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text('Nice')],
              ),
              onPressed: () {
                /// 弹窗消失
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  
}
