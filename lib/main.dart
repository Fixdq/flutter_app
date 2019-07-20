import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/model/user.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/router/application.dart';
import 'package:flutter_app/common/router/routers.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

import 'common/event/event_instance.dart';
import 'common/event/event_model.dart';

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
    ///fluro 路由
    final router = Router();

    /// 绑定路由
    Routers.configureRouters(router);
    Application.router = router;

    /// 主题设置
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
            /// 设置主题
            theme: store.state.themeData,

            /// 关闭debug标志
            debugShowCheckedModeBanner: false,

            /// 绑定路由
            onGenerateRoute: Application.router.generator,
          );
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
      case 10001:
        Fluttertoast.showToast(msg: "路由不正确");
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        Fluttertoast.showToast(msg: "网络错误");
        break;
      default:
        Fluttertoast.showToast(fontSize: 12.0, msg: "$message");
        break;
    }
  }
}
