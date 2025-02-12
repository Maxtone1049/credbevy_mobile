import 'package:json_annotation/json_annotation.dart';

part 'get_balance_res_model.g.dart';

@JsonSerializable()
class GetBalanceResModel {
  bool? error;
  String? message;
  double? data;

  GetBalanceResModel({this.error, this.message, this.data});

  factory GetBalanceResModel.fromJson(Map<String, dynamic> json) {
    return _$GetBalanceResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetBalanceResModelToJson(this);
}
