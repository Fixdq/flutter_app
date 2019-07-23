
class ResultBase {
  /// 响应数据
  var data;
  /// 是否是正确的请求
  bool result;
  /// 错误编码
  int code;
  /// header信息
  var headers;

  ResultBase(this.data, this.result, this.code, {this.headers});
}
