import 'package:json_annotation/json_annotation.dart';

import 'receiver.dart';
import 'sender.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  Sender? sender;
  Receiver? receiver;
  int? amount;

  Transaction({this.sender, this.receiver, this.amount});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return _$TransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
