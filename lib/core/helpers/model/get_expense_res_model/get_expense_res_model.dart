import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_expense_res_model.g.dart';

@JsonSerializable()
class GetExpenseResModel {
  bool? error;
  String? message;
  List<Datum>? data;

  GetExpenseResModel({this.error, this.message, this.data});

  factory GetExpenseResModel.fromJson(Map<String, dynamic> json) {
    return _$GetExpenseResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetExpenseResModelToJson(this);
}
