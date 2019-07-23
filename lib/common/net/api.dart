import 'package:dio/dio.dart';
import 'package:flutter_app/common/net/code.dart';
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
    isShow=true,
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    if (options == null) options = Options();
    if (header != null) options.headers = header;


    handleError(DioError e) {
      /**
       *  统一的错误处理方法
       *  将异常包装为 ResultBase 对象，返回
       *  响应拦截器 再进行处理
       */
      Response errorResponse;

      if (e.response != null) {
        /// 服务器有响应，但是带有错误的响应码：404, 503...
        /// 发送了请求，也收到了响应，是一个错误响应，带有错误验证码。
        errorResponse = e.response;
      } else {
        /// 错误发生在在服务器返回数据之前，`e.response` 为 `null`
        /// 发送了请求，压根没收到响应。
        errorResponse = Response(statusCode: -10);
      }

      /// 处理请求、响应超时
      if (e.type == DioErrorType.CONNECT_TIMEOUT || /// 请求超时
          e.type == DioErrorType.RECEIVE_TIMEOUT /// 响应超时
      ) {
        /// 设置请求错误状态吗
        errorResponse.statusCode = Code.NETWORK_TIMEOUT; /// 网络超时
      }

      /// 将结果返回
      return ResultBase(
          /// 错误信息
          Code.errorHandleFunction(errorResponse.statusCode, e.message, isShow),
          /// 是否正确请求 False
          false,
          /// 错误响应吗
          errorResponse.statusCode);
    }

    Response response;
    /// 处理发送之前的异常
    try {

      /// 发送请求
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
      /// 请求异常，调用异常处理方法
      return handleError(e);
    }

    if (response.data is DioError) {
      /// 响应异常，调用异常处理方法
      return handleError(response.data);
    }

    /// 正常响应， ResponseInterceptors 拦截器会统一处理响应
    return response.data;
  }

  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }

  post(
      String path, {
        data,
        header,
        isShow=true,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
      }) {
    return _net(
      path,
      header:header,
      isShow:true,
      data: data,
      options: _checkOptions("POST", options),
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }


  get(
      String path, {
        header,
        isShow=true,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
      }) {
    return _net(
      path,
      header:header,
      isShow:true,
      queryParameters: queryParameters,
      options: _checkOptions("GET", options),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }


}


final HttpManager httpUtil = HttpManager();