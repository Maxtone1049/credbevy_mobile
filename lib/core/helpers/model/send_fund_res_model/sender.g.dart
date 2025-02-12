// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
      id: (json['id'] as num?)?.toInt(),
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
    };
