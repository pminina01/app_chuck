import 'package:json_annotation/json_annotation.dart';

part 'ip.g.dart';

@JsonSerializable()
class IpResponseModel {
  final String ip;

  IpResponseModel(this.ip);

  factory IpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$IpResponseModelToJson(this);

  @override
  String toString() => 'ip: $ip';
}
