import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender {
  int? id;
  String? fullname;

  Sender({this.id, this.fullname});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return _$SenderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}
