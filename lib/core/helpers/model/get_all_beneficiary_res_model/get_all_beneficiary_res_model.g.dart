// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_beneficiary_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBeneficiaryResModel _$GetAllBeneficiaryResModelFromJson(
        Map<String, dynamic> json) =>
    GetAllBeneficiaryResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBeneficiaryResModelToJson(
        GetAllBeneficiaryResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
