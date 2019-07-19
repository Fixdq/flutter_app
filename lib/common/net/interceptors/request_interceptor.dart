import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";


class RequestInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  RequestInterceptors(this._dio);
  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(
          new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
              false,
              Code.NETWORK_ERROR));
    }
    return options;
  }
}
