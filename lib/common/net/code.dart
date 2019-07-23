import 'package:flutter_app/common/event/event_instance.dart';
import 'package:flutter_app/common/event/event_model.dart';

///错误编码
class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;


  static errorHandleFunction(code, message, isShow) {
    /// 错误信息处理，isShow 是否需要吐司提示，默认提示
    if(isShow) {
      /// 开火
      eventBus.fire(HttpErrorEvent(code, message));
      return message;
    }
    return message;
  }
}
