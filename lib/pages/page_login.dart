import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/redux/global_state.dart';
import 'package:flutter_app/common/style/global_style.dart';
import 'package:flutter_app/common/utils/common_utils.dart';
import 'package:flutter_app/widget/input_widget.dart';
import 'package:flutter_app/widget/theme_item_button.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginPage extends StatefulWidget {
  static final String sName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";

  /// 文本编辑控制器
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    /// 初始化编辑信息
    initParams();
  }

  @override
  Widget build(BuildContext context) {
    /// 共享store
    return StoreBuilder<GlobalState>(
      builder: (context,store){
        /// 触摸收起键盘
        return GestureDetector(
          /// todo
          behavior: HitTestBehavior.translucent,
          onTap: (){
            /// todo
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            appBar: AppBar(title: Text('登录'),),
            body: Container(
              /// 应用主题颜色
              color: Theme.of(context).primaryColor,
              /// 居中布局
              child: Center(
                /// 防止 overflow
                child: SafeArea(
                  /// 同时弹出键盘不遮挡
                    child: SingleChildScrollView(
                      /// 卡片布局
                      child: Card(
                        /// todo
                        elevation: 5.0,
                        /// todo
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        /// 背景颜色
                        color: Color(GlobalColors.white),
                        margin: EdgeInsets.only(left: 30.0,right: 30.0),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0,top: 40.0,right: 30.0,bottom: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset(GlobalIcons.LOGO,width: 90.0,height: 90.0,),
//                              SvgPicture.asset(GlobalIcons.LOGIN_USER,width: 90.0,height: 90.0,),
                              Padding(padding: EdgeInsets.all(10),),
                              InputWidget(
                                controller: usernameController,
                                hintText: '请输入用户名',
                                iconData: GlobalIcons.ACCOUNT_CIRCLE,
                                onChanged: (String value){
                                  _username = value;
                                },
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              InputWidget(
                                controller: passwordController,
                                hintText: '请输入密码',
                                obscureText: true,
                                iconData: GlobalIcons.ADB,
                                onChanged: (String value){
                                  _password = value;
                                },
                              ),
                              Padding(padding: EdgeInsets.all(10),),
                              FlexButton(
                                text: '登录',
                                color: Theme.of(context).primaryColor,
                                textColor: Color(GlobalColors.white),
                                onPress: (){
                                  if (_username == null || _username.trim().length == 0){
                                    return;
                                  }
                                  if (_password == null || _password.trim().length == 0){
                                    return;
                                  }

                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 初始化编辑框信息
  void initParams() async{
    /// 获取本地存储信息
    _username = await LocalStorage.get(Config.USER_NAME_KEY);
    _password = await LocalStorage.get(Config.PW_KEY);
    /// 填充编辑框
    usernameController.value = TextEditingValue(text: _username??'');
    passwordController.value = TextEditingValue(text: _password??'');
  }

}
