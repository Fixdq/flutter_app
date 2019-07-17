import 'package:flutter_app/common/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warp.g.dart';

@JsonSerializable()
class Warp{
  int status;
  User detail;


  Warp(this.status, this.detail);

  // 序列化
  factory Warp.fromJson(Map<String,dynamic> json) => _$WarpFromJson(json);
  // 反序列化
  Map<String,dynamic> toJson() => _$WarpToJson(this);
}