import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_cards_res_model.g.dart';

@JsonSerializable()
class GetCardsResModel {
  bool? error;
  String? message;
  List<Datum>? data;

  GetCardsResModel({this.error, this.message, this.data});

  factory GetCardsResModel.fromJson(Map<String, dynamic> json) {
    return _$GetCardsResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCardsResModelToJson(this);
}
