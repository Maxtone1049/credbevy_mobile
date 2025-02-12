// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_balance_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBalanceResModel _$GetBalanceResModelFromJson(Map<String, dynamic> json) =>
    GetBalanceResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetBalanceResModelToJson(GetBalanceResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
