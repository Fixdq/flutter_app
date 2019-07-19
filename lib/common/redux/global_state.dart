import 'package:flutter/material.dart';
import 'package:flutter_app/common/model/user.dart';
import 'package:flutter_app/common/redux/theme_redux.dart';
import 'package:flutter_app/common/redux/user_redux.dart';


///redux 全局State
class GlobalState{
  User userInfo;
  ThemeData themeData;

  GlobalState({this.userInfo, this.themeData});

}

/// 创建reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store

GlobalState AppReducer(GlobalState state,action){
  return GlobalState(
    userInfo: UserReducer(state.userInfo,action),
    themeData: ThemeDataReducer(state.themeData,action) ,
  );
}