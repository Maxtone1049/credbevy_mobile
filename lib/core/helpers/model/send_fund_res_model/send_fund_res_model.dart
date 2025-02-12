import 'package:json_annotation/json_annotation.dart';

import 'transaction.dart';

part 'send_fund_res_model.g.dart';

@JsonSerializable()
class SendFundResModel {
  bool? error;
  String? message;
  Transaction? transaction;

  SendFundResModel({this.error, this.message, this.transaction});

  factory SendFundResModel.fromJson(Map<String, dynamic> json) {
    return _$SendFundResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendFundResModelToJson(this);
}
