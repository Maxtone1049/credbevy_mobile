// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_expense_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExpenseResModel _$GetExpenseResModelFromJson(Map<String, dynamic> json) =>
    GetExpenseResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetExpenseResModelToJson(GetExpenseResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
