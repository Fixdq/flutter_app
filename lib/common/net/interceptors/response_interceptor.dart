import 'package:dio/dio.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {

  @override
  onResponse(Response response) {

    /// 对响应数据 做统一处理
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }
}