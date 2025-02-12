import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
  int? id;
  String? fullname;

  Receiver({this.id, this.fullname});

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return _$ReceiverFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}
