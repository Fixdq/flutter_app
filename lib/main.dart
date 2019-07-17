import 'package:flutter/material.dart';
import 'package:flutter_app/common/model/user.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_app/common/utils/navigator_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'pages/page_home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  ///创建Store，
  ///initailState 初始化State
  final store = new Store<GlobalState>(
      AppReducer,
      initialState: new GlobalState(
        userInfo: User.empty(),
        themeData: CommonUtils.getThemeData(GlobalColors.primarySwatch),
      ));

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<GlobalState>(
            builder: (context,store){
              return MaterialApp(
                theme: store.state.themeData,
                routes: {
                  HomePage.sName: (_) => HomePage(),
                }
              );
            }
        )
    );
  }
}
