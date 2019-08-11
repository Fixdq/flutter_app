import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/listview/page_listview_base.dart';
import 'package:flutter_app/pages/listview/page_listview_load_to_refresh.dart';
import 'package:flutter_app/pages/listview/page_listview_pull_to_refresh.dart';
import 'package:flutter_app/pages/listview/page_listview_sliver.dart';
import 'package:flutter_app/pages/listview/page_listview_sliver_simple.dart';
import 'package:flutter_app/pages/page_dialogs.dart';
import 'package:flutter_app/pages/page_home.dart';
import 'package:flutter_app/pages/page_listview.dart';
import 'package:flutter_app/pages/page_login.dart';
import 'package:flutter_app/pages/page_theme.dart';

/// home 主页
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return HomePage();
});

/// login 登录
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

/// theme 改变主题
var themeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ThemeChange();
});

/// listview home
var listViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FListViewPage();
});

/// listview home
var listViewBaseHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ListViewBasePage();
});

/// listview home
var listViewPullHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ListViewPullPage();
});

/// listview home
var listViewLoadHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ListViewLoadPage();
});

/// listview sliver demo
var listViewSliverHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ListViewSliverPage();
});

/// listview sliver simple demo
var listViewSliverSimpleHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ListViewSliverSimpleView();
});

/// dialog demo
var dialogSimpleHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return DialogPage();
});
