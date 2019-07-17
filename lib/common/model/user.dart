import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id;
  String username;
  String image_url;
  String image;
  String nick;
  String real_name;
  int phone_right;
  String key;
  String shop;
  String permission;
  String employee_id;
  String role;
  String shop_name;

  User(
      this.id,
      this.username,
      this.image_url,
      this.image,
      this.nick,
      this.real_name,
      this.phone_right,
      this.key,
      this.shop,
      this.permission,
      this.employee_id,
      this.role,
      this.shop_name);
//反序列化
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//序列化
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // 命名构造函数
  User.empty();
}
