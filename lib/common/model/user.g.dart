// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'] as String,
      json['username'] as String,
      json['image_url'] as String,
      json['image'] as String,
      json['nick'] as String,
      json['real_name'] as String,
      json['phone_right'] as int,
      json['key'] as String,
      json['shop'] as String,
      json['permission'] as String,
      json['employee_id'] as String,
      json['role'] as String,
      json['shop_name'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image_url': instance.image_url,
      'image': instance.image,
      'nick': instance.nick,
      'real_name': instance.real_name,
      'phone_right': instance.phone_right,
      'key': instance.key,
      'shop': instance.shop,
      'permission': instance.permission,
      'employee_id': instance.employee_id,
      'role': instance.role,
      'shop_name': instance.shop_name
    };
