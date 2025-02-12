// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_fund_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendFundModelEntity _$SendFundModelEntityFromJson(Map<String, dynamic> json) =>
    SendFundModelEntity(
      receiverId: (json['receiver_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SendFundModelEntityToJson(
        SendFundModelEntity instance) =>
    <String, dynamic>{
      'receiver_id': instance.receiverId,
      'amount': instance.amount,
    };
