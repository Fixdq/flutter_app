import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_app/common/utils/navigator_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ThemeChange extends StatelessWidget {
  static final String sName = '/theme';

  showThemeDialog(BuildContext context, Store store) {

    // 主题标签
    List<String> title_list = [
      '默认主题1',
      '默认主题2',
      '默认主题3',
      '默认主题4',
      '默认主题5',
      '默认主题6',
      '默认主题7',
    ];

    /// 主题选择对话框
    CommonUtils.showCommitOptionDialog(context, title_list, (index) {
      Fluttertoast.showToast(msg: index.toString());
      // 更换主题
      CommonUtils.pushTheme(store, index);
      // 保存主题选择到本地
      LocalStorage.setInt(Config.THEME_COLOR, index);
    }, colorlist: CommonUtils.getThemeListColor());
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GlobalState>(
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            title: Text('主题相关'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.title,
                  size: 50.0,
                ),
                onTap: (){
                  showThemeDialog(context,store);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
