import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/event/event_instance.dart';
import 'package:flutter_app/common/event/event_model.dart';
import 'package:flutter_app/common/router/router_handlers.dart';

class Routers {
  static var defaultTransition = TransitionType.native;
  static String home = "/";
  static String login = "/login";
  static String theme = "/theme";
  static String listview = "/listview";
  static String listviewbase = "/listview/base";
  static String listviewpull = "/listview/pull";
  static String listviewload = "/listview/load";
  static String listviewsliver = "/listview/sliver";
  static String listviewsliversimple = "/listview/sliver/simple";

  static void configureRouters(Router router) {
    /// 匹配失败处理
    router.notFoundHandler = Handler(
        handlerFunc:(BuildContext context, Map<String, List<String>> parameters) {
          print('没有匹配的路由');
          eventBus.fire(HttpErrorEvent(10001,"没有匹配的路由"));
    });

    /// 绑定路由
    router.define(home, handler: homeHandler, transitionType: defaultTransition);
    router.define(login, handler: loginHandler, transitionType: defaultTransition);
    router.define(theme, handler: themeHandler, transitionType: defaultTransition);
    router.define(listview, handler: listViewHandler, transitionType: defaultTransition);
    router.define(listviewbase, handler: listViewBaseHandler, transitionType: defaultTransition);
    router.define(listviewpull, handler: listViewPullHandler, transitionType: defaultTransition);
    router.define(listviewload, handler: listViewLoadHandler, transitionType: defaultTransition);
    router.define(listviewsliver, handler: listViewSliverHandler, transitionType: defaultTransition);
    router.define(listviewsliversimple, handler: listViewSliverSimpleHandler, transitionType: defaultTransition);

  }
}
