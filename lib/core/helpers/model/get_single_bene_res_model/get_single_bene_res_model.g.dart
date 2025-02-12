// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_bene_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleBeneResModel _$GetSingleBeneResModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleBeneResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleBeneResModelToJson(
        GetSingleBeneResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
