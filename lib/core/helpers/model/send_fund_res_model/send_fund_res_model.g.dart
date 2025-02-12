// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_fund_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendFundResModel _$SendFundResModelFromJson(Map<String, dynamic> json) =>
    SendFundResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendFundResModelToJson(SendFundResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'transaction': instance.transaction,
    };
