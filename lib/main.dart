import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/model/user.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

import 'common/event/event_instance.dart';
import 'common/event/event_model.dart';
import 'pages/page_home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  StreamSubscription stream;

  ///创建Store，
  ///initailState 初始化State
  final store = Store<GlobalState>(AppReducer,
      initialState: GlobalState(
        userInfo: User.empty(),
        themeData: CommonUtils.getThemeData(GlobalColors.primarySwatch),
      ));

  MyApp({
    Key key,
  }) : super(key: key) {
    print('start');
    getThemeColorIndex(this.store);

    /// 初始化 event 监听
    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  getThemeColorIndex(Store store) async {
    int index = await LocalStorage.getInt(Config.THEME_COLOR);
    print(index);
    if (null != index) {
      await CommonUtils.pushTheme(store, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<GlobalState>(builder: (context, store) {
          return MaterialApp(
              theme: store.state.themeData,
              routes: {
                HomePage.sName: (context) {return HomePage();},
          });
        }));
  }

  errorHandleFunction(int code, String message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(msg: "网络错误");
        break;
      case 401:
        Fluttertoast.showToast(msg: "网络错误");
        break;
      case 403:
        Fluttertoast.showToast(msg: "网络错误");
        break;
      case 404:
        Fluttertoast.showToast(msg: "网络错误");
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        Fluttertoast.showToast(msg: "网络错误");
        break;
      default:
        Fluttertoast.showToast(
            fontSize:12.0,
            msg: "$message");
        break;
    }
  }
}
