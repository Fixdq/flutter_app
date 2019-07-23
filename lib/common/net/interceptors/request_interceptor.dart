import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/result_data.dart';


class RequestInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  RequestInterceptors(this._dio);
  @override
  onRequest(RequestOptions options) async {
    /// 没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      /// 请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      /// 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      return _dio.resolve(
          new ResultBase(Code.errorHandleFunction(Code.NETWORK_ERROR, "",true),
              false,
              Code.NETWORK_ERROR));
    }
    return options;
  }
}
