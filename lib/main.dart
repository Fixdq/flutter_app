import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/model/user.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_app/common/utils/navigator_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'pages/page_home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ///创建Store，
  ///initailState 初始化State
  final store = Store<GlobalState>(
      AppReducer,
      initialState: GlobalState(
        userInfo: User.empty(),
        themeData: CommonUtils.getThemeData(GlobalColors.primarySwatch),
      ));

  MyApp({Key key,}) : super(key: key){
    print('start');
    getThemeColorIndex(this.store);
  }

  getThemeColorIndex(Store store) async {
    int index = await LocalStorage.getInt(Config.THEME_COLOR);
    print(index);
    if (null != index){
      await CommonUtils.pushTheme(store, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<GlobalState>(
            builder: (context,store){
              return MaterialApp(
                theme: store.state.themeData,
                routes: {
                  HomePage.sName: (context){
                    return HomePage();
                  },
                }
              );
            }
        )
    );
  }
}
