import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_beneficiary_res_model.g.dart';

@JsonSerializable()
class GetAllBeneficiaryResModel {
  bool? error;
  String? message;
  List<Datum>? data;

  GetAllBeneficiaryResModel({this.error, this.message, this.data});

  factory GetAllBeneficiaryResModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllBeneficiaryResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllBeneficiaryResModelToJson(this);
}
