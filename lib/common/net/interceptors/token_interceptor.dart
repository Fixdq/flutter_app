import 'package:dio/dio.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/common/local/local_storage.dart';


class TokenInterceptors extends InterceptorsWrapper {

  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = 'Token '+_token;
    return options;
  }


  @override
  onResponse(Response response) async{

    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.getString(Config.TOKEN_KEY);
    if (token == null) {
      return null;
    } else {
      this._token = token;
      return token;
    }
  }
}