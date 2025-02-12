import 'package:json_annotation/json_annotation.dart';

part 'send_fund_model_entity.g.dart';

@JsonSerializable()
class SendFundModelEntity {
  @JsonKey(name: 'receiver_id')
  int? receiverId;
  int? amount;

  SendFundModelEntity({this.receiverId, this.amount});

  factory SendFundModelEntity.fromJson(Map<String, dynamic> json) {
    return _$SendFundModelEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendFundModelEntityToJson(this);
}
