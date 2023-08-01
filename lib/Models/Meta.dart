import 'package:json_annotation/json_annotation.dart';
part 'Meta.g.dart';

@JsonSerializable()
class DataMeta {
  String? Message;
  String? Code;
  String? Status;

  DataMeta({this.Message, this.Code, this.Status});

  factory DataMeta.fromJson(Map<String, dynamic> data) =>
      _$DataMetaFromJson(data);

  Map<String, dynamic> toJson() => _$DataMetaToJson(this);
}
