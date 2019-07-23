import 'package:dio/dio.dart';
import 'package:flutter_app/common/model/warp.dart';
import 'package:flutter_app/common/net/code.dart';
import 'package:flutter_app/common/net/result_data.dart';

class ResponseInterceptors extends InterceptorsWrapper {

  @override
  onResponse(Response response) {

    /// 对响应数据 做统一处理
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {

        /// 数据的外层解析
        return handleResonse(response);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        /// 数据的外层解析
        return handleResonse(response);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return ResultBase(response.data, false, response.statusCode, headers: response.headers);
    }
  }

  ResultBase handleResonse(Response response) {
      /// 数据的外层解析
    Warp warp = Warp.fromJson(response.data);
    if (0 == warp.status){
      return ResultBase(warp.detail, true, Code.SUCCESS);
    }else{
      return ResultBase(Code.errorHandleFunction(Code.SUCCESS, warp.detail, true), false, Code.SUCCESS);
    }
  }
}