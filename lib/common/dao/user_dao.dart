import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';
import 'package:flutter_app/common/model/warp.dart';
import 'package:flutter_app/common/net/address.dart';
import 'package:flutter_app/common/net/api.dart';
import 'package:flutter_app/common/utils/common_utils.dart';

class UserDao{

  static login(username,password,store) async {
    print('UserDao req start');

    // md加密
    password = CommonUtils.generateMd5(password);
    await LocalStorage.setString(Config.USER_NAME_KEY, username);
    var res = await httpUtil.post(Address.urlLogin(),data:{'phone':username,"password":password});
    if (res != null && res.result){
      print(res.data);
      Warp user = Warp.fromJson(res.data);
      print(user.detail.id);
    }

    return 'res';
  }

}