import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

///通过 flutter_redux 的 combineReducers，创建 Reducer<State> 
final ThemeDataReducer = combineReducers<ThemeData>([
  ///将Action，处理Action动作的方法，State绑定
  TypedReducer<ThemeData,RefreshThemeDataAction>(_refresh),
]);



/// 定义处理action 行为的方法  返回新的state
ThemeData _refresh(ThemeData themeData,action){
  themeData = action.themeData;
  print(themeData.primaryColor);
  return themeData;
}

/// 定义action 类
/// 将 Action 与 处理该Action 的方法绑定
class RefreshThemeDataAction{
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}