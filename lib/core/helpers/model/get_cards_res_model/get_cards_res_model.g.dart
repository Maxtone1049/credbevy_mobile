// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cards_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardsResModel _$GetCardsResModelFromJson(Map<String, dynamic> json) =>
    GetCardsResModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardsResModelToJson(GetCardsResModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
