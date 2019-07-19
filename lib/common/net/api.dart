import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/interceptors/error_interceptor.dart';
import 'package:flutter_app/common/net/interceptors/header_interceptor.dart';
import 'package:flutter_app/common/net/interceptors/log_interceptor.dart';
import 'package:flutter_app/common/net/interceptors/response_interceptor.dart';
import 'package:flutter_app/common/net/interceptors/token_interceptor.dart';
import 'package:flutter_app/common/net/interceptors/request_interceptor.dart';
import 'package:flutter_app/common/net/result_data.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  Dio _dio = Dio(); // 使用默认配置

  final TokenInterceptors _tokenInterceptors = TokenInterceptors();

  HttpManager() {
    /// 中间件 绑定
    _dio.interceptors.add(RequestInterceptors(_dio));
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(LogsInterceptors());
//    _dio.interceptors.add(ErrorInterceptors(_dio));
    _dio.interceptors.add(ResponseInterceptors());
  }

  _net(
    String path, {
    header,
    noTip = false,
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    if (options == null) options = Options();
    if (header != null) options.headers = header;

    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    Response response;
    try {
      response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return response.data;
  }

  /// POST 请求
  post(path,{data,Map<String, dynamic> header,onTap=false,Options options,})async{
    return await _net(path,data: data,header:header,noTip: onTap,options: _checkOptions("POST",options));
  }



  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }
}


final HttpManager httpUtil = HttpManager();