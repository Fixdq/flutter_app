import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

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
      body: Builder(builder: (BuildContext context) {
        return ListView(
          children: <Widget>[
            RaisedButton(
              child: Text('SimpleDialog'),
              onPressed: () {
                _simpleDialog(context);
              },
            ),
            RaisedButton(
              child: Text('AlertDialog'),
              onPressed: () {
                _alertDialog(context);
              },
            ),
            RaisedButton(
              child: Text('CupertionAlertDialog'),
              onPressed: () {
                _cupertionAlertDialog(context);
              },
            ),
            RaisedButton(
              child: Text('StatefulWidgetDialog'),
              onPressed: () {
                _statefulWidgetDialog(context);
              },
            ),
            RaisedButton(
              child: Text('SnackBar'),
              onPressed: () {
                _scaffoldSnackBar(context);
              },
            ),
            RaisedButton(
              child: Text('BottomSheet'),
              onPressed: () {
                _showBottomSheet(context, 1);
              },
            ),
            RaisedButton(
              child: Text('ModalBottomSheet'),
              onPressed: () {
                _showBottomSheet(context, 2);
              },
            ),
            RaisedButton(
              child: Text('CalendarDataPicker'),
              onPressed: () {
                _calendarDataPicker(context);
              },
            ),
            RaisedButton(
              child: Text('TimeDataPicker'),
              onPressed: () {
                _timeDataPicker(context);
              },
            ),
            RaisedButton(
              child: Text('CupertinoPicker'),
              onPressed: () {
                _showCupertinoPicker(context);
              },
            ),
            RaisedButton(
              child: Text('ThirdDateTimePicker'),
              onPressed: () {
                _showThirdDateTimePicker(context);
              },
            ),
          ],
        );
      }),
    );
  }

  /// SimpleDialog
  _simpleDialog(BuildContext context) {
    /// 标题
    var _title = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg',
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

  /// AlertDialog
  _alertDialog(BuildContext context) {
    var _title = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAH0AfQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD0Ciiivx8+mCiiigYUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUxnxwOtdmCwNfG1PZ0I3f4L1MK+Jp0I81R2HEgdaYZPQUwknrSV+g5dwlhqEVLE+/L8P+CfNYrOatR2pe6vxH+Y3tUituqCnIcEVpnPD+EqYSUqEFGUVdW8uhOBzKtGslOV0yaiiivy4+uCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiimucLXRhMPLE14UY7ydjKtVVKm6j6DXfIwKjrbFlYpoH2h2BnYZB3c5z0xWKa/Y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KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//9k=",
          height: 30.0,
          width: 30.0,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text("AlertDialog")
      ],
    );

    var _content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:
              'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=619291746,1342600010&fm=26&gp=0.jpg',
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text("Nice")
      ],
    );

    /// actions
    var _actionYes = FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('是'));
    var _actionNo = FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('否'));

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: _title,
            content: _content,
            actions: <Widget>[
              _actionYes,
              _actionNo,
            ],
          );
        });
  }

  /// cupertionAlertDialog
  _cupertionAlertDialog(BuildContext context) {
    var _title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("提示")],
    );

    var _content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[Text("确认删除吗")],
    );

    /// actions
    var _actionYes = CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('是'));
    var _actionNo = CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('否'));

    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: _title,
            content: _content,
            actions: <Widget>[
              _actionYes,
              _actionNo,
            ],
          );
        });
  }

  /// StatefulWidgetDialog
  _statefulWidgetDialog(BuildContext context) {
    var propress = 0.0;

    StateSetter stateSetter;

    /// 计时器 模拟进度
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      propress += 0.01;
      print(propress);
      if (stateSetter != null) {
        stateSetter(() {});
      }
      if (propress >= 1) {
        timer.cancel();
        stateSetter = null;
        Navigator.of(context).pop();
      }
    });

    var _builder = StatefulBuilder(builder: (context, state) {
      stateSetter = state;
      return Center(
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Card(
            color: Colors.blue.withAlpha(200),
            elevation: 24.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  value: propress,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "done ${((propress - 0.1) * 100).toStringAsFixed(1)}%",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
    });
    showDialog(context: context, builder: (context) => _builder);
  }

  /// 使用Scaffold.of方法获取ScaffoldState调用showSnackBar
  _scaffoldSnackBar(BuildContext context) {
    var snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text('下载完成了'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
          label: '确定',
          onPressed: () {
            print('再见');
          }),
    );

    Scaffold.of(context).showSnackBar(snackbar);
  }

  /// 底部抽屉弹框
  _showBottomSheet(BuildContext context, int type) {
    var _bottomSheet = BottomSheet(onClosing: () {
      print('关闭了');
    }, builder: (BuildContext context) {
      return Container(
        color: Colors.greenAccent,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Center(
            heightFactor: 1.0,
//            child: Text('BottomSheet'),
            child: CachedNetworkImage(
              imageUrl:
                  "https://ss1.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=92afee66fd36afc3110c39658318eb85/908fa0ec08fa513db777cf78376d55fbb3fbd9b3.jpg",
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    });
    if (type == 1) {
      /// showBottomSheet 点击不会消失的bottomsheet
      Scaffold.of(context).showBottomSheet(_bottomSheet.builder);
    }
    if (type == 2) {
      /// showModalBottomSheet  点击其他地方会消失的bottomsheet
      showModalBottomSheet(context: context, builder: _bottomSheet.builder);
    }
  }

  /// 日期选择
  _calendarDataPicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2090),
    );
  }

  /// 时间选择
  _timeDataPicker(BuildContext context) {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  /// 选择表
  _showCupertinoPicker(BuildContext context) {
    var listTitles = ['AA', 'BB', 'CC', 'DD', 'EE'];
    var picker = CupertinoPicker(
      /// item 高度
      itemExtent: 40.0,
      onSelectedItemChanged: (index) {
        print("index==${index},value==${listTitles[index]}");
      },
      children: listTitles.map((v) {
        return Text(v);
      }).toList(),
    );

    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 200.0,
            child: picker,
          );
        });
  }

  /// 第三方日期插件
  /// 日期选择
  _showThirdDateTimePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      locale: DateTimePickerLocale.zh_cn,
      onCancel: () => print("取消"),
      onClose: () => print("关闭"),
      onConfirm: (date, List<int> index) {
        print(date);
      },
      onChange: (date, List<int> index) {
        print(date);
      },
    );
  }
}
