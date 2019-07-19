import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";


class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {

    return options;
  }
}
