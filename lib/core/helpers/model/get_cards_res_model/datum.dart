import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  @JsonKey(name: 'card_number')
  String? cardNumber;
  @JsonKey(name: 'card_type')
  String? cardType;
  int? balance;
  String? name;
  @JsonKey(name: 'bank_name')
  String? bankName;
  @JsonKey(name: 'expiry_date')
  String? expiryDate;

  Datum({
    this.id,
    this.cardNumber,
    this.cardType,
    this.balance,
    this.name,
    this.bankName,
    this.expiryDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
