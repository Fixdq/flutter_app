import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/redux/theme_redux.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/navigator_utils.dart';
import 'package:flutter_app/widget/theme_item_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';

class CommonUtils {
  /// 获取APP默认主题列表
  static List<Color> getThemeListColor() {
    return [
      GlobalColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  /// redux 分发 action
  /// 更换主题
  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData));
  }

  /// 根据颜色获取主题
  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }

  ///列表item dialog
  static Future<Null> showCommitOptionDialog(BuildContext context,
      List<String> themeTitlelist, ValueChanged<int> onTap,
      {width = 250.0, height = 400.0, List<Color> colorlist}) {
    return NavigatorUtils.showFixDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Color(GlobalColors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: ListView.builder(
                  itemCount: colorlist.length,
                  itemBuilder: (context, index) {
                return FlexButton(
                  text: themeTitlelist[index],
                  maxLines: 1,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontSize: 14.0,
                  color: colorlist != null
                      ? colorlist[index]
                      : Theme.of(context).primaryColor,
                  textColor: Color(GlobalColors.white),
                  onPress: () {
                    Navigator.pop(context);
                    onTap(index);
                  },
                );
              }),
            ),
          );
        });
  }

  static getPermissions() async {

    /// 检查权限
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    /// 是否授权
    if(permission!= PermissionStatus.granted){
      /// 打开应用设置＃
//      bool isOpened = await PermissionHandler().openAppSettings();
      /// 申请权限
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);

      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        return null;
      }
    }
  }


  /// MD5 加密
  static generateMd5(String data){
    var content = Utf8Encoder().convert(data);
    var  digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}


