// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['user_id'] as num?)?.toInt(),
  token: json['token'] as String? ?? "",
  error: json['error'] as String? ?? "",
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'token': instance.token,
      'error': instance.error,
    };
