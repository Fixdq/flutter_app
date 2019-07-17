// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warp _$WarpFromJson(Map<String, dynamic> json) {
  return Warp(
      json['status'] as int,
      json['detail'] == null
          ? null
          : User.fromJson(json['detail'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WarpToJson(Warp instance) =>
    <String, dynamic>{'status': instance.status, 'detail': instance.detail};
