import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_single_bene_res_model.g.dart';

@JsonSerializable()
class GetSingleBeneResModel {
  bool? error;
  String? message;
  Data? data;

  GetSingleBeneResModel({this.error, this.message, this.data});

  factory GetSingleBeneResModel.fromJson(Map<String, dynamic> json) {
    return _$GetSingleBeneResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetSingleBeneResModelToJson(this);
}
