// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      cardNumber: json['card_number'] as String?,
      cardType: json['card_type'] as String?,
      balance: (json['balance'] as num?)?.toInt(),
      name: json['name'] as String?,
      bankName: json['bank_name'] as String?,
      expiryDate: json['expiry_date'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'card_number': instance.cardNumber,
      'card_type': instance.cardType,
      'balance': instance.balance,
      'name': instance.name,
      'bank_name': instance.bankName,
      'expiry_date': instance.expiryDate,
    };
